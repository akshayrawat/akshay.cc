### 
# Compass
###

# Susy grids in Compass
# First: gem install compass-susy-plugin
# require 'susy'

# Change Compass configuration
compass_config do |config|
  config.output_style = :compact
end

class HighlightedHTML < Redcarpet::Render::HTML
  def block_code(code, language)
    result = %Q{<div class="highlight #{language}">}
    result += '<div class="ribbon"></div>'
    code.gsub!(/^\n+/, '')
    code.rstrip!
    code = CodeRay.scan(code, language)
    result += code.div css: :class,
                    line_numbers: :table,
                    line_number_anchors: false

    result += %Q{</div>}
    result
  end
end

set :markdown_engine, :redcarpet
set :markdown, tables: true,
               autolink: true,
               gh_blockcode: true,
               fenced_code_blocks: true,
               lax_html_blocks: true,
               renderer: HighlightedHTML.new

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
# 
# With no layout
# page "/path/to/file.html", :layout => false
# 
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
# 
# A path which all have the same layout


# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
helpers do
  def nav_class_for nav_page
    nav_page == @page ? "active" : "inactive"
  end
end


set :css_dir, 'css'
set :js_dir, 'js'
set :images_dir, 'img'

page '/*', layout: '/layouts/layout'

activate :blog do |blog|
  blog.prefix = "blog"
  blog.layout = 'layouts/blog'
  blog.permalink = ":year-:month-:day-:title.html"
end

ignore 'layouts/*'

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript

  # Enable cache buster
  # activate :cache_buster

  # Use relative URLs
  # activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
end
