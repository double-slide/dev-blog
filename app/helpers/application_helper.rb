module ApplicationHelper
  def markdown(text)
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true)
    parser = Redcarpet::Markdown.new(renderer, extensions = {})
    parser.render(text).html_safe
  end
end
