---
title: New Blog for Christmas
date: 2011/12/28 17:19:47
categories: Blog Maintenance, Python
---
I decided to give myself a new blog for Christmas. All of my_ other_
blogs_ are based on b2evolution_. It has served me well for years but
I don't use much of its functionality, and hate dealing with its
comment spam issues so much that I've turned off comments on all of
those blogs. Most of all though, I want to use reStructuredText_ to
write blog posts, just like I use it to write the vast majority of
other content and docs that I create.

.. _my: http://sadahome.ca/blogs/doug.php
.. _other: http://sadahome.ca/blogs/adventures.php
.. _blogs: http://sadahome.ca/blogs/paradocs.php
.. _b2evolution: http://b2evolution.net
.. _reStructuredText: http://docutils.sourceforge.net/rst.html

Blogofile_ caught my eye a while ago, not just because it easy
supports reStructuredText markup, but also because:

.. _Blogofile: http://blogofile.com

* it simplifies the blogging workflow to:

  * write in your favourite editor
  * build
  * upload

* it gets rid of the overhead of a blogging app and database backend

* it fits nicely into a version control workflow

* it encourages delegation of comments, etc. (and the related spam
  issues) to Disqus_

  .. _Disqus: http://disqus.com

In for a Penny, in for a Python 3 Pound
---------------------------------------

There are `lots of cool features`_ in the development version of
Blogofile, but running it requires Python 3. That's okay with me
though because with `all the libraries and frameworks that run under
Python 3 now`_ it's about time I started to use it for something
serious.

.. _lots of cool features: http://blogofile.com/blog/2011/04/30/preview-of-blogofile-0.8/
.. _all the libraries and frameworks that run under Python 3 now: http://pypi.python.org/pypi?:action=browse&c=533&show=all

A couple of observations:

* I still have Python 2.6 set as my default version (for now), so
  that's what virtualenv_ runs under. But ``virtualenv -p python3
  blogofile-dev`` happily built a Python 3 virtualenv for me to
  install Blogofile and its dependencies in. Is there no end to the
  awesome that virtualenv delivers?!

  .. _virtualenv: http://pypi.python.org/pypi/virtualenv

* I installed Blogofile with ``python setup.py develop`` and noticed
  some pauses as the various dependency libraries were being installed
  in the virtualenv that were longer than what I'm used to when those
  libraries are installed under Python 2. My totally uninformed guess
  is that pauses were due to ``2to3`` being run in the libraries'
  setup.

So far I've had no need to touch Python code in the Blogofile
context. It has all been Mako_, HTML5, CSS and reStructuredText so
far. Perhaps when I start to write a converter to migrate old posts
from `sadahome.ca/blogs/doug.php`_ to here I'll have more to say on the
differences between Python 3 and Python 2.

.. _Mako: http://www.makotemplates.org
.. _sadahome.ca/blogs/doug.php: http://sadahome.ca/blogs/doug.php


A Whole New Site, Actually
--------------------------

Blogofile is more than a blogging tool though; it's a static site
builder. So, I took the opportunity to add some structure and style to
the whole `douglatornell.ca` site. Migrating the content was easy,
largely because it was already all in reStructuredText markup. The
biggest time-sink was my attempt to create a new theme with a
different colour scheme. Once again I was reminded at how badly I
suck at the design aspect of web development. I settled for changing
the title font to something that looks less like Comic Sans.

.. _douglatornell.ca: http://douglatornell.ca


Things That Still Need to be Done
---------------------------------

* Automate the process of pushing new content to Webfaction_
  `(affiliate link)`_, either via a `Mercurial hook`_, or a Fabric_
  task, in contrast to the manual rsync command I'm using now
* Use Disqus for comments
* Migrate at least the Python-related content from sadahome.ca/blogs/doug.php
* Convert the Nosy_ docs to Sphinx_ and move them to `Read the Docs`_
* Add a Flickr_ badge to display a selection of my images in the
  sidebar

.. _Webfaction: http://www.webfaction.com
.. _(affiliate link): http://www.webfaction.com/?affiliate=dlatornell
.. _Mercurial hook: https://groups.google.com/forum/#!topic/blogofile-discuss/4D-UKzZVIY4
.. _Fabric: http://docs.fabfile.org
.. _Nosy: http://pypi.python.org/pypi/nosy
.. _Sphinx: http://sphinx.pocoo.org/
.. _Read the Docs: http://readthedocs.org/
.. _Flickr: http://www.flickr.com/photos/sada_images/
