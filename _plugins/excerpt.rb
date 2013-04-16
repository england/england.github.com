module Jekyll
  module Filters
    def excerpt(content, post_url, link_text = 'Read more...')
      if content.include? '<!--more-->'
        content.gsub(
          /<!--more-->.*/m,
          "<p><a href=\"#{post_url}\">#{link_text}</a></p>"
        )
      else
        content
      end
    end
  end
end
