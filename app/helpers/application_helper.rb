module ApplicationHelper
  HTML_PIPLINE = HTML::Pipeline.new [ HTML::Pipeline::MarkdownFilter,
                                      HTML::Pipeline::EmojiFilter,
                                      HTML::Pipeline::RougeFilter
                                    ], { gfm: true,
                                         asset_root: '/images'
                                       }

  def markdownify(text)
    HTML_PIPLINE.call(text)[:output].to_s.html_safe
  end
end
