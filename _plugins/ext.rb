require 'jekyll/tagging'
require "jekyll-assets"
require "jekyll-assets/compass"

require "zurb-foundation"

Sprockets.append_path Compass::Frameworks['foundation'].stylesheets_directory
Sprockets.append_path Compass::Frameworks['foundation'].stylesheets_directory + '../js'
