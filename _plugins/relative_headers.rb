Jekyll::Hooks.register :site, :pre_render do |site|
  # Process every post in memory before any page starts rendering
  site.posts.docs.each do |post|
    # Calculate the internal source directory (e.g., _posts/2026-06-25-pico-clock/)
    source_dir = post.path.sub(File.basename(post.path), '')

    # The final generated URL path for the post (e.g., /retrocomputing/pico-clock/)
    base_url = post.url

    hidden_tags = ""

    process_image = ->(field_value, target_width) do
      is_image_file = field_value.is_a?(String) && field_value.match?(/\.(jpe?g|png|gif|webp|svg)$/i)

      if is_image_file && !field_value.start_with?('/', 'http')
        full_source = "#{source_dir}#{field_value}"

        # Use ImageMagick to check the width of the source image
        source_width = `identify -format "%w" "#{full_source}" 2>/dev/null`.strip.to_i

        hidden_tags += "{% capture dummy_ri %}{% responsive_image path: #{full_source} %}{% endcapture %}\n"

        # Fall back to absolute site URL if image is too small to be resized
        if source_width > 0 && source_width < target_width
          "#{base_url}#{field_value}"
        else
          "/assets/resized/#{target_width}/#{field_value}"
        end
      else
        field_value
      end
    end

    if post.data['header']
      if post.data['header']['overlay_image']
        post.data['header']['overlay_image'] = process_image.call(post.data['header']['overlay_image'], 1280)
      end

      if post.data['header']['teaser']
        post.data['header']['teaser'] = process_image.call(post.data['header']['teaser'], 480)
      end
    end

    if post.data['teaser']
      post.data['teaser'] = process_image.call(post.data['teaser'], 480)
    end

    post.content = hidden_tags + post.content unless hidden_tags.empty?
  end
end
