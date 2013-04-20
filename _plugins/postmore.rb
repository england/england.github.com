module PostMore
  def postmorefilter(input, url, text)
    if input.include? "<!--more-->"
      input.split("<!--more-->").first + "<p class='more'><a href='#{url}#more'>#{text}</a></p>"
    else
      input
    end
  end
end

Liquid::Template.register_filter(PostMore)

module Jekyll
  module Filters
    def mark_excerpt(content)
      content.gsub '<!--more-->', '<span name="more" id="more"></span>'
    end
  end
end
