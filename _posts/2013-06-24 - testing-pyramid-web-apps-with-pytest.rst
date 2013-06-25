---
title: Testing Pyramid Web Apps with pytest
permalink: http://douglatornell.ca/blog/2013/06/24/testing-pyramid-web-apps-with-py-test
date: 2013/06/24 16:03:47
categories: python, pyramid, testing, pytest
guid: yv7H9YDFb90fhZrIm7kNdqqF98o=
draft: true
---

I recently took another look at pytest_ and liked what I saw.
Previously,
I had used it to try it out and couldn't see much advantage over nose_ or the Python standard library unittest_ module
(the Python 2.7+ version,
that is).
Several features of recent versions of pytest_ changed my mind,
but chief among them is `fixtures as function arguments`_.
In fact,
I think that and other features make pytest_ the most Pythonic of current crop of testing frameworks.
But that's a subject for another post...

.. _pytest: http://pytest.org/
.. _nose: https://nose.readthedocs.org/
.. _unittest: http://docs.python.org/3/library/unittest.html
.. _fixtures as function arguments: http://pytest.org/latest/fixture.html
.. _Pyramid: http://www.pylonsproject.org/projects/pyramid/about

In this post I'm going to focus on  how to use pytest_ to test a Pyramid_ web app.
Let's start with a trival Pyramid_ view function that simply returns a ``dict`` that will be used to render a template::

  #!python
  @view_config(route='hello', renderer='hello.mako')
  def my_view(request):
      return {'greeting': 'Hello world!'}

and an equally trivial unit test for that view function::

  #!python
  def test_my_view():
      from views import my_view
      response = my_view(request)
      assert response['greeting'] == 'Hello world!'

As written,
that test will error out with a syntax error because '`request'` is undefined.
We'll deal with that by setting up a pytest_ fixture to provide us with ``pyramid.testing.DummyRequest`` instance::

  #!python
  from pyramid import testing
  import pytest

  @pytest.fixture
  def pyramid_req():
      return testing.DummyRequest()

  def test_my_view(pyramid_req):
      from views import my_view
      response = my_view(pyramid_req)
      assert response['greeting'] == 'Hello world!'

Easy!
Each test function that uses ``pyramid_req`` as an argument gets a fresh ``pyramid.testing.DummyRequest`` instance to work with.
Note that pytest_ has its own concept of a "request" to allow `test fixtures to interact with the requesting text context`_ and that effectively makes ``request`` a reserved argument name,
so we distinguish the Pyramid_ request by calling our test fixture function ``pyramid_req``.

.. _test fixtures to interact with the requesting text context: http://pytest.org/latest/fixture.html#fixtures-can-interact-with-the-requesting-test-context

Also note the things that we didn't have to do:

* Our test function is just that - a plain function,
  not a method of a class that subclasses ``unittest.TestCase``.
* There are no ``setUp`` or ``tearDown`` functions for methods.
* The test assertion is a simple Python ``assert`` statement,
  not a special method or function call like ``assertEqual``.

If we change our test assertion so that the test will fail::

  #!python
  ...
  assert response['greeting'] == 'Hello Jupiter!'

and run the test suite,
we get

