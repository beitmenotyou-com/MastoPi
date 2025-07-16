module ApplicationHelper
  def svg_icon(name, options = {})
    file = Rails.root.join("..", "theme", "icons", "#{name}.svg")
    return "" unless File.exist?(file)
    content = File.read(file)
    if options[:class] || options[:aria]
      require 'nokogiri'
      doc = Nokogiri::HTML::DocumentFragment.parse(content)
      svg = doc.at_css 'svg'
      svg['class'] = options[:class] if options[:class]
      if options[:aria]
        svg['aria-label'] = options[:aria]
      else
        svg['aria-hidden'] = 'true'
        svg['focusable'] = 'false'
      end
      content = doc.to_html
    end
    content.html_safe
  end
end
