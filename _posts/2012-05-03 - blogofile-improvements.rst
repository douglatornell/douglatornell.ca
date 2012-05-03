---
title: Blogofile Improvements
permalink: http://douglatornell.ca/blog/2012/05/03/blogofile-improvements
date: 2012/05/03 19:42:33
categories: Python, Blogofile, Blog Maintenance
guid: b'7lkI8a6iaU0Hd7YppBDyIJPLs0k='
---

I finally got around to fixing a couple of minor annoyances I have with
Blogofile_.
These fixes apply to the plugins_ development branch of Blogofile
and the `Blogofile_blog`_ plugin,
but they should be easily backport-able to the Blogofile master branch.
I opened pull requests for these changes on Github
and I'm happy to report that `@EnigmaCurry`_ merged the Blogofile_blog ones
within hours!
But since Blogofile development and this blog have been languishing
for a while,
I figured I should write about the changes here.

.. _Blogofile: http://www.blogofile.com/
.. _plugins: https://github.com/EnigmaCurry/blogofile/branches/plugins
.. _Blogofile_blog: https://github.com/EnigmaCurry/blogofile_blog
.. _@EnigmaCurry: http://twitter.com/#!/EnigmaCurry

Using Python 2.7 and 3.2 with the ``PYTHONWARNINGS`` environment
variable set to ``default``
reveals that both Blogofile and the Blogofile_blog plugin raise
``ResourceWarning`` exceptions when the ``blogofile build`` command is run.
Admittedly, this is a really minor issue,
but seeing a screen full of tracebacks every time I build my site is
annoying,
and it can obscure more serious problems.
Those warnings are easily silenced by changing the offending
``open`` statements to use ``with`` statement context managers.
The fix for Blogofile is in `pull request 119`_
and the one for Blogofile_blog is in `pull request 7`_.

.. _pull request 119: https://github.com/EnigmaCurry/blogofile/pull/119
.. _pull request 7: https://github.com/EnigmaCurry/blogofile_blog/pull/7

The ``blogofile blog create post`` command creates a file with the extension
``.markdown`` by default
but Blogofile also supports RST_ and Textile_ markup.
I use RST and really want my newly created post files to have the extension
``.rst`` so that emacs goes to ``rst-mode`` automatically when
I open a post file for editing.
Again,
a minor annoyance,
and my fix was easily implemented.
I chose to add a ``blog.post.default_markup`` config option.
With ``blog.post.default_markup = 'rst'`` in my site's ``_config.py`` file
my new posts get the ``.rst`` extension I want.
If ``blog.post.default_markup`` is not set the created post file extension
defaults to ``.markdown`` as before.
This feature is in `pull request 8`_.

.. _RST: http://docutils.sourceforge.net/rst.html
.. _Textile: http://textile.thresholdstate.com/
.. _pull request 8: https://github.com/EnigmaCurry/blogofile_blog/pull/8

I really like Blogofile
an using it's plugins branch was my spur to get serious about using
Python 3 and blogging again.
So, I'm really happy to see @EnigmaCurry accepting pull requests again
on the project. Hooray!!
