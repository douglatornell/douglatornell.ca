<header>
  <div id="header" class="header_gradient theme_font">
    <h1><a href="${bf.util.site_path_helper()}">${bf.config.blog.name}</a></h1>
  </div>
  <div id="navigation" class="grid_12">
<%
def nav_class(path):
   render_path = bf.template_context.render_path.rsplit("/index.html")[0]
   if render_path == path or (path == "/" and render_path == "."):
      return "selected"
   return ""
%>
<%
def blog_nav_class():
   render_path = bf.template_context.render_path.rsplit("/index.html")[0]
   if render_path.startswith("/blog") and "archive" not in render_path:
      return "selected"
   return ""
%>
    <ul class="theme_font">
      <li><a href="${bf.util.site_path_helper()}"
             class="${nav_class(bf.util.site_path_helper())}">Home</a></li>
      <li><a href="${bf.util.site_path_helper('projects', trailing_slash=True)}"
             class="${nav_class('projects')}">Projects</a></li>
      <li><a href="${bf.util.site_path_helper(bf.config.blog.path, trailing_slash=True)}"
             class="${blog_nav_class()}">Blog</a></li>
      <li><a href="${bf.util.site_path_helper(bf.config.blog.path, 'archive', trailing_slash=True)}"
             class="${nav_class(bf.util.site_path_helper(bf.config.blog.path, 'archive'))}">Archives</a></li>
    </ul>
  </div>
</header>
