---
title: Using Sublime Text Build System for Project Unit Tests
permalink: http://douglatornell.ca/blog/2013/07/04/sublime-text-build-system-for-project-unit-tests
date: 2013/07/04 16:03:41
categories: python, testing, sublime-text
guid: b'qHtXIq388_lRU8FBMJmXsJ_JmVE='
---

I spent some time today learning about the `Build System`_.
In addition to the built-in build systems for various languages,
and the possibility of defining custom build systems at the user preference level,
you can also specify `project build systems`_.

.. _Build System: http://docs.sublimetext.info/en/latest/file_processing/build_systems.html
.. _project build systems: http://www.sublimetext.com/docs/3/projects.html

I added the following stanza to one of my ``.sublime-project`` files::

  #!json
  "build_systems":
   [
       {
           "name": "unittest-discover",
           "shell_cmd": "~/.virtualenvs/randopony-tetra-2.7/bin/python
                         -m unittest discover ${project_path}"
       }
   ]

to enable me to run the test suite for the project within Sublime at the touch of a key.

Things to note:

* The ``name`` element defines how the build will appear in the ``Tools > Build System`` menu.

* In the ``shell_cmd`` element:

  * I use an explicit path to the ``python`` interpreter in the project's ``virtualenv`` so that the project's dependencies are found correctly.

  * The shell that the Sublime ``build`` command launches will have as its ``cwd`` the directory that the file you initiate the ``build`` command from is in.
    ``${project_path}`` is a `build system variable`_ that points to the directory where the ``.sublime-project`` file is,
    and I use that to tell ``unittest discover`` where to start searching for tests.

    .. _build system variable: http://docs.sublimetext.info/en/latest/reference/build_systems.html#build-system-variables

* You can define as many build systems as you want in the ``.sublime-project`` file,
  just be sure to give them different names.

After reloading the ``.sublime-project`` file,
choose ``unittest-discover`` from the ``Tools > Build System`` menu,
and launch a build (``⌘B`` on OS/X),
and voilà,
the test suite runs in a pane that pops up at the bottom of the Sublime window.
