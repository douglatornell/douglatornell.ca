---
title: Stayin' Alive
permalink: http://douglatornell.ca/blog/2012/01/08/staying-alive
date: 2012/01/08 17:05:21
categories: Python, SQLAlchemy, Pyramid, MySQL
guid: b'FaCIP9dznnAjY2EUaXnLxfvt6tI='
---

Stayin' Alive
=============

MySQL Connection Timeout and SQLAlchemy Connection Pool Recycling
-----------------------------------------------------------------

Recently a Pyramid web app surprised me with some odd behaviour. The
app uses SQLAlchemy to interface with a MySQL database. The first
request of the day would always fail with a traceback that ended with
some sort of database connection failure, though not always the same
error. This was happening in the development environment where I was
the only one sending requests to the server. Hitting refresh, or
sending another request resulted in the expected response, and things
would continue to work that way - until the next morning...

The subtitle gives lots of hints about what was going on, so if you're
still reading at this point I'll assume that you're still as puzzled
as I was.

It took a surprising number of tries on Google before I found `this
section`_ of the SQLAlchemy docs which explains all. To summarize, the
default configuration of MySQL drops connections on which there has
been no activity for 8 hours. SQLAlchemy provides the ``pool_recycle``
parameter for its engine creation functions as a way of working around
that behaviour. (Although, as noted in the `SQLAlchemy Engine creation
API docs`_ full description of ``pool_recycle``, the behaviour is also
configurable at the MySQLDB connection, and database configuration
levels too.)

.. _this section: http://www.sqlalchemy.org/docs/core/pooling.html?highlight=pool_recycle#setting-pool-recycle

.. _SQLAlchemy Engine creation API docs: http://www.sqlalchemy.org/docs/core/engines.html?highlight=pool_recycle#engine-creation-api

Since my Pyramid app uses the ``sqlalchemy.engine_from_config``
function, all I had to do was add::

  #!ini
  sqlalchemy.pool_recycle = 3600

to my ``development.ini`` and ``production.ini`` config files, and ... problem
solved.

P.S. Sorry - I couldn't resist the `Bee Gees reference`_ in the
title. It's an age thing...

.. _Bee Gees reference: http://www.youtube.com/watch?v=I_izvAbhExY
