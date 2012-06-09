<%inherit file="base.mako"/>
<!doctype html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width">
${self.head()}
</head>
  <body>
    <div id="container" class="container container_12">
      <div id="main" role="main">
        <div id="main_block">
          ${self.header()}
          <div id="prose_block" class="grid_8">
            ${next.body()}
          </div>
          <div id="sidebar" class="grid_4">
            ${self.sidebar()}
          </div>
          <div class="clear"></div>
        </div>
      </div>
      ${self.footer()}
    </div>
    ${self.body_scripts()}
  </body>
</html>
<%def name="head()"><%include file="head.mako"/></%def>
<%def name="header()"><%include file="header.mako"/></%def>
<%def name="sidebar()"><%include file="sidebar.mako"/></%def>
<%def name="footer()"><%include file="footer.mako"/></%def>
<%def name="body_scripts()"><%include file="body_scripts.mako"/></%def>
