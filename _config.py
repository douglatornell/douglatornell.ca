# -*- coding: utf-8 -*-

######################################################################
# This is your site's Blogofile configuration file.
# www.Blogofile.com
#
# This file doesn't list every possible setting, it relies on defaults
# set in the core blogofile _config.py. To see where the default
# configuration is on your system run 'blogofile info'
#
######################################################################

######################################################################
# Basic Settings
#  (almost all sites will want to configure these settings)
######################################################################
## site_url -- Your site's full URL
# Your "site" is the same thing as your _site directory.
#  If you're hosting a blogofile powered site as a subdirectory of a larger
#  non-blogofile site, then you would set the site_url to the full URL
#  including that subdirectory: "http://www.yoursite.com/path/to/blogofile-dir"
site.url = "http://douglatornell.ca"

## site.author -- Your name, the author of the website.
# This is optional. If set to anything other than None, the
# simple_blog template creates a meta tag for the site author.
site.author = "Doug Latornell"

site.file_ignore_patterns.append(
    # Mercurial tags file
    ".*/.hgtags",
)

#### Blog Settings ####
blog = plugins.blog

## blog_enabled -- Should the blog be enabled?
#  (You don't _have_ to use blogofile to build blogs)
blog.enabled = True

## blog_path -- Blog path.
#  This is the path of the blog relative to the site_url.
#  If your site_url is "http://www.yoursite.com/~ryan"
#  and you set blog_path to "/blog" your full blog URL would be
#  "http://www.yoursite.com/~ryan/blog"
#  Leave blank "" to set to the root of site_url
blog.path = "/blog"

## blog_name -- Your Blog's name.
# This is used repeatedly in default blog templates
blog.name = "Doug Latornell"

## HTML5 example customizes the blog templates.
## Delete this setting to use the default ones instead.
blog.template_path = "_templates/blog"

## blog_description -- A short one line description of the blog
# used in the RSS/Atom feeds.
blog.description = ""

## blog_timezone -- the timezone that you normally write your blog posts from
blog.timezone = "Canada/Pacific"

blog.disqus.enabled = True
blog.disqus.name = "douglatornell"

blog.post.default_markup = 'rst'
blog.post.default_filters = {
    "rst": "rst, syntax_highlight"
}
filters.syntax_highlight.style = "default"
