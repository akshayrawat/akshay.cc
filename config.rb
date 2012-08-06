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


set :markdown_engine, :redcarpet
set :markdown, tables: true, autolink: true, gh_blockcode: true

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

  def render_blog_body body
    redcarpet = Redcarpet::Markdown.new(Redcarpet::Render::HTML, fenced_code_blocks: true)
    redcarpet.render(body)
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
