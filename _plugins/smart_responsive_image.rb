module Jekyll
  module ResponsiveFilter
    def responsive_file(input, alt = "")
      # 1. Access the page date from the 'context'
      page = @context.registers[:page]
      date_str = page['date'].strftime("%Y-%m-%d") rescue Time.now.strftime("%Y-%m-%d")

      # 2. Build the path the plugin needs to find
      # Adjust "assets/img" to match your actual folder structure
      full_path = "assets/images/#{date_str}-#{input}"

      # 3. Use Jekyll's internal tag lookup to find the responsive_image tag
      tag_class = Liquid::Template.tags['responsive_image']

      # 4. Instead of .new, we parse it through Liquid's template system
      template = Liquid::Template.parse("{% responsive_image path: '#{full_path}' alt: '#{alt}' %}")
      template.render(@context)
    end
  end
end

Liquid::Template.register_filter(Jekyll::ResponsiveFilter)
