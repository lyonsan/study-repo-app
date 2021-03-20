module MarkdownHelper
  def markdown(detail)
    options = {
      filter_html: true,
      hard_wrap: true,
      space_after_headers: true,
      with_toc_data: true
    }
    extensions = {
      autolink: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      tables: true
    }
    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)
    markdown.render(detail).html_safe
  end

  # def toc(detail)
  #   toc_option = {
  #     nesting_level: 2
  #   }

  #   toc_renderer = Redcarpet::Render::HTML_TOC.new
  #   toc = Redcarpet::Markdown.new(toc_renderer, toc_option)
  #   toc.render(detail).html_safe
  # end
end