module Jekyll
  class SmartImgTag < Liquid::Tag
    def initialize(tag_name, markup, tokens)
      super
      @markup = markup.strip
    end

    def render(context)
      page = context.registers[:page]
      date_str = page['date'].strftime("%Y-%m-%d") rescue Time.now.strftime("%Y-%m-%d")

      if @markup =~ /^["']?([^"'\s]+)["']?\s*(.*)$/
        input_path = $1
        raw_attributes = $2
      else
        return "Error parsing smart_img tag: #{@markup}"
      end

      filename = context[input_path] || input_path

      attributes = raw_attributes.gsub(/(\w+)\s*=/, '\1:')

      full_path = "assets/images/#{date_str}-#{filename}"
      responsive_markup = "path: '#{full_path}' #{attributes}"

      template = Liquid::Template.parse("{% responsive_image #{responsive_markup} %}")
      template.render(context)
    end
  end
end

Liquid::Template.register_tag('smart_img', Jekyll::SmartImgTag)
