---
title: YAML Fixtures in Django Tests
permalink: http://douglatornell.ca/blog/2012/01/23/yaml-fixtures-in-django-tests
date: 2012/01/23 16:14:25
categories: Python, Django, Testing
guid: b'Uh4r66L0WAftlp9llpZD3eV7X7U='
---

I have a Django project called RandoPony_ that handles event
registration for the `BC Randonneurs Cycling Club`_. It's on an annual
release cycle; i.e. I spend the few weeks that pass for winter in
Vancouver updating the project. That's when I bump it to the latest
version of Django, fixing minor bugs, and adding new features that I
and other users have come up with during the preceding year. Once I
release a new version for the new year, I usually don't have to worry
about the code until the next winter. The pony just works,
facilitating people doing `hundreds of thousands of kilometres`_ of
crazy long cycling events, and we like it that way!

.. _RandoPony: http://randopony.randonneurs.bc.ca/
.. _BC Randonneurs Cycling Club: http://www.randonneurs.bc.ca/
.. _hundreds of thousands of kilometres: http://www.randonneurs.bc.ca/recbook1/part_sum.html

My workflow at the beginning of the annual update looks something
like:

* Create a new ``virtualenv``
* Install the latest version of Django and other project dependencies
* Read the release notes for the Django releases since the one I was
  working with last
* Run the RandoPony test suite to find deprecations and other obvious
  breakage
* Start hacking

I recently started working on the 2012 release of RandoPony and was
blown away when I ran the test suite because there were *over 60
failing tests!* It took me way longer than it should have to figure
out why things were so massively broken.

The problem was that the test fixtures weren't being installed. They
weren't being installed because they are YAML files and I had
forgotten to install PyYAML in the ``virtualenv``. What's really
annoying is that the fixtures files were being ignored silently.

It turns out that if you specify a YAML fixture for a Django
TestCase::

  #!python
  class TestPopulairesListView(django.test.TestCase):
      """Functional tests for populaires-list view.
      """
      fixtures = ['populaires']

without giving the fixture file a ``.yaml`` extension, the fixture will
be silently ignored if PyYAML isn't installed. Really, Django?!

So, the number 1 thing that I should have done to save myself from
this thrash was to explicitly specify the serialization format of my
fixtures::

  #!python
  class TestPopulairesListView(django.test.TestCase):
      """Functional tests for populaires-list view.
      """
      fixtures = ['populaires.yaml']

Then the Django test runner would have told me::

  Problem installing fixture 'populaires': yaml is not a known
  serialization format.

I'll take the hit for ignoring the `PEP 20`_ aphorism "Explicit is
better than implicit". But shouldn't Django get docked for "Errors
should never pass silently"?

.. _PEP 20: http://www.python.org/dev/peps/pep-0020/

The other thing I should have done was use a `pip requirements file`_
for the project.

.. _pip requirements file: http://www.pip-installer.org/en/latest/requirements.html

RandoPony has 2 requirements files now. ``requirements.txt`` for the
packages required for the production deployment, and
``requirements-dev.txt`` for the additional packages, like PyYAML,
required for development work. Now I just have to hope that I'm smart
enough when I start work on the 2013 release to do::

  #!sh
  (randopony)$ pip install -r requirements.txt
  (randopony)$ pip install -r requirements-dev.txt

