"""Syntax highlighter for code embedded as literal block in rst posts.

Based on http://techspot.zzzeek.org/2010/12/06/my-blogofile-hacks/

This filter works on code embedded using the Docutils literal block
markup of `::` followed by indentation. The language to use for syntax
highlighting is specifiedby a `sh-bang` comment at the beginning of
the block. Example::

  This is some blog text.  Some code::

    #!python
    print "hello world"

Two config file settings are required to make this filter work::

  blog.post.default_filters = {
      "rst": "rst, syntax_highlight"
  }
  filters.syntax_highlight.style = "default"

The first causes blogofile to translate the rst source to HTML first,
and then run the syntax_highlight filter. That's oposite to the
default order.

The second specifies the pygments style to use.
"""
import blogofile_bf as bf
from mako.filters import html_entities_unescape
import os
from pygments import util, formatters, lexers, highlight
import re


meta = {"name": "Syntax Highlighter",
        "description": "Highlights blocks of code prefixed with "
                       "#!<language name> based on syntax",
        "author": "Doug Latornell"}

css_files_written = set()

code_block_re = re.compile(
    r"<pre class=\"literal-block\">\n"
    r"(?:#\!(?P<lang>\w+)\n)?"
    r"(?P<code>.*?)"
    r"</pre>"
    , re.DOTALL
)


def highlight_code(code, language, formatter):
    try:
        lexer = lexers.get_lexer_by_name(language)
    except util.ClassNotFound:
        lexer = lexers.get_lexer_by_name("text")
    highlighted = highlight(code, lexer, formatter)
    highlighted = "\n\n{0}\n\n".format(highlighted)
    return highlighted


def write_pygments_css(style, formatter, location="/css"):
    path = bf.util.path_join("_site", bf.util.fs_site_path_helper(location))
    bf.util.mkdir(path)
    css_path = os.path.join(path, "pygments_" + style + ".css")
    if css_path in css_files_written:
        return #already written, no need to overwrite it.
    with open(css_path, "w") as f:
        f.write(formatter.get_style_defs(".pygments_" + style))
    css_files_written.add(css_path)


def run(src):
    style = bf.config.filters.syntax_highlight.style
    css_class = "pygments_" + style
    formatter = formatters.HtmlFormatter(
        linenos=False, cssclass=css_class, style=style)
    write_pygments_css(style, formatter)

    def repl(m):
        lang = m.group('lang')
        code = m.group('code')
        code = html_entities_unescape(code)
        return highlight_code(code, lang, formatter)

    return code_block_re.sub(repl, src)
