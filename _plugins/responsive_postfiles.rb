Jekyll::Hooks.register :posts, :pre_render do |post|
  # Get the directory of the current post relative to the site root (e.g., "_posts/my-post" or "_posts")
  post_dir = File.dirname(post.path)

  # Match standard Markdown images: ![Alt text](image.jpg) or ![Alt text](image.jpg "Title")
  # This regex safely ignores absolute URLs (http://) and root-relative URLs (/)
  post.content.gsub!(/!\[(.*?)\]\((?!https?:\/\/|\/)([^"\s]+)(?:\s+"(.*?)")?\)/) do |match|
    alt_text = $1
    image_filename = $2
    title_text = $3

    # Combine the post's directory with the image's filename
    full_source_path = File.join(post_dir, image_filename)

    # Generate the Jekyll-Responsive-Image Liquid tag
    tag = "{% responsive_image path: #{full_source_path} alt: \"#{alt_text}\""
    tag += " title: \"#{title_text}\"" if title_text
    tag += " %}"

    tag
  end
end
