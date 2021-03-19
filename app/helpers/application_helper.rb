module ApplicationHelper
  # require 'redcarpet'
  # require 'coderay'


  # class HTMLwithCoderay < Redcarpet::Render::HTML
  #   def block_code(code, language)
  #     language = language.split(':')[0]

  #     lang = if language.to_s == 'rb'
  #              'ruby'
  #            elsif language.to_s == 'yml'
  #              'yaml'
  #            elsif language.to_s == 'css'
  #              'css'
  #            elsif language.to_s == 'html'
  #              'html'
  #            elsif language.to_s == ''
  #              'md'
  #            elsif (language.to_s.include?('```')) && (language.to_s.exclude?("\n"))
  #              'md'
  #            else
  #              language
  #            end
    
  #     CodeRay.scan(code, lang).div
  #   end
  # end

  # def markdown(text)
  #   html_render = HTMLwithCoderay.new(filter_html: true, hard_wrap: true)
  #   options = {
  #     autolink: true,
  #     space_after_headers: true,
  #     no_intra_emphasis: true,
  #     fenced_code_blocks: true,
  #     tables: true,
  #     hard_wrap: true,
  #     xhtml: true,
  #     lax_html_blocks: true,
  #     strikethrough: true
  #   }
  #   markdown = Redcarpet::Markdown.new(html_render, options)
  #   markdown.render(text)
  # end
end
