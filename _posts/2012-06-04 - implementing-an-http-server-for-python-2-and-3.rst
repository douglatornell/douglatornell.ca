---
title: Implementing An HTTP Server for Python 2 and 3
permalink: http://douglatornell.ca/blog/2012/06/04/implementing-an-http-server-for-python-2-and-3
date: 2012/06/04 05:40:13
categories: python, blogofile, python3 porting
guid: b'S8-pKtzCr6bVfLY8Q47QO9NJbuA='
---

I've done some work recently to get the `blogofile plugins branch`_ working
under Python 2.6, 2.7 and 3.2 from single codebase.
The ``blogofile serve`` command runs an HTTP server on localhost to let you
check the results of your ``blogofile build`` before you deploy it to the
waiting world.
In Python 3 (in which the plugins branch was initially implemented) the
relevant bits of the implementation go like::

  #!python
  import http.server
  import threading

  class Server(threading.Thread):
      def __init__(self, port, address):
          HandlerClass = BlogofileRequestHandler
          ServerClass = http.server.HTTPServer
          self.httpd = ServerClass(('127.0.0.1', 8080), HandlerClass)

      def run(self):
          self.httpd.serve_forever()

      def shutdown(self):
          self.httpd.shutdown()
          self.httpd.socket.close()

  class BlogofileRequestHandler(http.server.SimpleHTTPRequestHandler):
      def __init__(self, *args, **kwargs):
          http.server.SimpleHTTPRequestHandler.__init__(
              self, *args, **kwargs)

      def translate_path(self, path):
          ...

.. _blogofile plugins branch: https://github.com/EnigmaCurry/blogofile

Some ``import`` acrobatics are required to get that to also run under Python 2::

  #!python
  try:
      from http.server import HTTPServer as http_server
  except ImportError:
      from SocketServer import TCPServer as http_server
  try:
      from http.server import SimpleHTTPRequestHandler \
          as http_handler
  except ImportError:
      from SimpleHTTPServer import SimpleHTTPRequestHandler \
          as http_handler
  import threading

  class Server(threading.Thread):
      def __init__(self, port, address):
          HandlerClass = BlogofileRequestHandler
          ServerClass = http_server
          self.httpd = ServerClass(('127.0.0.1', 8080), HandlerClass)

      def run(self):
          self.httpd.serve_forever()

      def shutdown(self):
          self.httpd.shutdown()
          self.httpd.socket.close()

  class BlogofileRequestHandler(http_handler):
      def __init__(self, *args, **kwargs):
          http_handler.__init__(self, *args, **kwargs)

      def translate_path(self, path):
          ...

The `six library`_ provides a nice way to clean up the hard to read
``try:... except ImportError:...`` blocks::

  #!python
  import threading
  from six.moves import SimpleHTTPServer
  from six.moves import socketserver

  http_server = socketserver.TCPServer
  http_handler = SimpleHTTPServer.SimpleHTTPRequestHandler

  class Server(threading.Thread):
      def __init__(self, port, address):
          HandlerClass = BlogofileRequestHandler
          ServerClass = http_server
          self.httpd = ServerClass(('127.0.0.1', 8080), HandlerClass)

      def run(self):
          self.httpd.serve_forever()

      def shutdown(self):
          self.httpd.shutdown()
          self.httpd.socket.close()

  class BlogofileRequestHandler(http_handler):
      def __init__(self, *args, **kwargs):
          http_handler.__init__(self, *args, **kwargs)

      def translate_path(self, path):
          ...

.. _six library: http://packages.python.org/six/

Note that this implementation steps back from the
Python 3 ``http.server.HTTPServer`` as the server class
to the underlying ``socketserver.TCPServer``
(or ``SocketServer.TCPServer`` in Python 2).
