  <title>${bf.config.blog.name}</title>
  <meta name="description" content="${bf.config.blog.description}">
%if bf.config.site.author:
  <meta name="author" content="${bf.config.site.author}">
%endif
  <link rel="alternate" type="application/rss+xml" title="RSS 2.0" href="${bf.util.site_path_helper(bf.config.blog.path,'/feed',trailing_slash=True)}">
  <link rel="alternate" type="application/atom+xml" title="Atom 1.0" href="${bf.util.site_path_helper(bf.config.blog.path,'/feed/atom',trailing_slash=True)}">
  <link rel="shortcut icon" href="${bf.util.site_path_helper('favicon.ico')}">

  <link rel="stylesheet" href="${bf.util.site_path_helper('css/grid.css?v=1')}">
  <link rel="stylesheet" media="handheld" href="${bf.util.site_path_helper('/css/handheld.css?v=1')}">
  <link rel="stylesheet" href="${bf.util.site_path_helper('css/pygments_'+bf.config.filters.syntax_highlight.style+'.css')}">

<%include file="theme.mako"/>

  <link rel="openid2.provider" href="https://www.google.com/accounts/o8/ud?source=profiles">
  <link rel="openid2.local_id" href="http://www.google.com/profiles/djlatornell">

  <meta name="bitly-verification" content="2df6afc07963">

  <script src="${bf.util.site_path_helper('js/libs/modernizr-2.5.3.min.js')}"></script>
