---
title: Blogofile Deployment on Webfaction
permalink: http://douglatornell.ca/blog/2012/11/15/blogofile-deployment-on-webfaction
date: 2012/11/15 22:14:47
categories: blogofile, blog maintenance, python, webfaction
guid: b'-D0f7_oZzGlY8AT3vGeWaspP0pY='
draft: true
---

After updating my checkouts of the blogofile and blogofile repos from GitHub
in my WebFaction account,
I had to do the following to get HEAD installed:

* Create a clean ``$HOME/lib/python3.2/`` directory

* Download and unpack the ``distribute`` and ``pip`` tarballs,
  and install them with::

    PYTHONPATH=$HOME/lib/python3.2 python3.2 setup.py install --home=$HOME

* Install the blogofile dependencies with::

    pip-3.2 install --upgrade --install-option="--install-scripts=$HOME/bin" --install-option="--install-lib=$HOME/lib/python3.2" --editable $HOME/blogofile

  That command fails when it tries to install blogofile itself, however.
  To finish the install use::

    pip-3.2 install --upgrade --install-option="--script-dir=$HOME/bin" --install-option="--install-dir=$HOME/lib/python3.2" --editable $HOME/blogofile

* Finally, do an editable install of blogofile_blog with::

    pip-3.2 install --upgrade --install-option="--script-dir=$HOME/bin" --install-option="--install-dir=$HOME/lib/python3.2" --editable $HOME/blogofile_blog
