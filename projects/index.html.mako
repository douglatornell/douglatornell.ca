<%inherit file="/_templates/site.mako" />
<article class="page_box">
<%self:filter chain="rst">

===================
 Software Projects
===================

Open source projects that I have contributed to
(patches, docs, bug reports, etc.):

* buildbot_
* blogofile_
* colander_
* contextlib2_
* couchdbkit_
* `Mozilla Add-on SDK`_
* pymodbus_
* `Pyramid Documentation`_
* `Python Documentation`_
* sphinx_
* `turbogears 2`_
* virtualenvwrapper_
* webtest_

.. _buildbot: http://buildbot.net/
.. _blogofile: http://blogofile.com/
.. _colander: http://docs.pylonsproject.org/projects/colander/
.. _contextlib2: http://contextlib2.readthedocs.org/
.. _couchdbkit: http://couchdbkit.org/
.. _Mozilla Add-on SDK: https://addons.mozilla.org/en-US/developers/builder
.. _pymodbus: https://github.com/bashwork/pymodbus/
.. _Pyramid Documentation: http://docs.pylonsproject.org/en/latest/docs/pyramid.html
.. _Python Documentation: http://python.org/
.. _sphinx: http://sphinx.pocoo.org/
.. _turbogears 2: http://turbogears.org/2.0/
.. _virtualenvwrapper: http://www.doughellmann.com/projects/virtualenvwrapper/
.. _webtest: http://pythonpaste.org/webtest/

.. image:: https://www.ohloh.net/accounts/147609/widgets/account_tiny.gif
   :height: 15px
   :width: 80px
   :alt: Ohloh profile for dlatornell
   :target: https://www.ohloh.net/accounts/147609?ref=Tiny

My Bitbucket account is https://bitbucket.org/douglatornell/
and my Github account is https://github.com/douglatornell/


Personal Projects That I Have Released
======================================

* nosy_
    Run the nose_ test discovery and execution tool whenever a
    source file is changed
    (`nosy repo on Bitbucket`_)

  .. _nose: https://nose.readthedocs.org/
  .. _nosy: http://douglatornell.ca/software/python/Nosy/
  .. _nosy repo on Bitbucket: https://bitbucket.org/douglatornell/nosy/

* randopony_
    ``RandoPony`` is a web application that manages on-line pre-registrations for
    marathon cycling events run by the BC Randonneurs Cycling Club.
    "The pony" maintains online lists of riders that have pre-registered for
    each event,
    sends email confirmations of pre-registration to rider,
    and email notifications to event organizers.
    It also interfaces with Google Drive to build a rider list spreadsheet as
    pre-registrations come in.
    Originally implemented in Django_,
    ``RandoPony`` is now a Pyramid_/SQLAlchemy_ project.

    `Django project repo`_

    `Pyramid/SQLAlchemy project repo`_

  .. _randopony: http://randopony.randonneurs.bc.ca/
  .. _Django: https://www.djangoproject.com/
  .. _Pyramid: http://www.pylonsproject.org/
  .. _SQLAlchemy: http://www.sqlalchemy.org/
  .. _Pyramid/SQLAlchemy project repo: https://bitbucket.org/douglatornell/randopony-tetra/
  .. _Django project repo: https://bitbucket.org/douglatornell/randopony/


* pyramid_persona_group_auth_demo_

    The source code for a `blog post`_ I wrote about using Mozilla Persona for
    authentication in a Pyramid web framework application with a SQL database
    as its persistence layer.

    .. _pyramid_persona_group_auth_demo: https://bitbucket.org/douglatornell/pyramid_persona_group_auth_demo
    .. _blog post: http://douglatornell.ca/blog/2012/10/27/pyramid-persona-group-level-auth



Blogofile and blogofile_blog
============================

I am the lead maintainer for the Blogofile_ project,
a role I assumed when the project's creator lost interest in continued
development of Blogofile,
but the user community refused to let the project die.
Blogofile is a static web site builder with roots in the creation of blog
sites.
It provides a way of building dynamic feeling web sites (like blogs) that
don't require a database or other complex computing infrastructure.
Blogofile sites can be served from most hosting providers.
Because the sites that Blogofile produces are composed of static web pages
they avoid most of the security vulnerabilities of dynamic site tools like
Wordpress.
Blogofile sites require minimal maintenance,
freeing their owners to focus on content creation and other fun things in
life.

When I took on the lead maintainer role Blogofile was in the midst of being
transformed to a core and plug-ins architecture.
I completed enough of that work to get to the `0.8b1 release of Blogfile`_ and
the blog creation functionality as a reference plugin implementation,
`blogofile_blog`_.
Significant features of that work were:

* Unification of the codebase for Python 2.6, 2.7 and 3.2
  (no 2to3 or 3to2 conversion required).

* Moving the project documentation source files have been moved into the project
  repository.
  They are built and rendered at http://docs.blogofile.com/ thanks to
  the readthedocs.org service.

* Refactoring of the configuration system,
  and the site initialization syntax and functionality.

* Improved Unicode handling in several areas,
  with the help of Blogofile's increasingly international user community.

.. _0.8b1 release of Blogfile: http://pypi.python.org/pypi/Blogofile/
.. _blogofile_blog: http://pypi.python.org/pypi/blogofile_blog/


SOG Coupled Biology & Physics Model of Deep Estuaries
=====================================================

SOG is a research model developed by `Dr. Susan Allen's`_ coastal
oceanography group in the Department of Earth, Atmosphere and Ocean
Sciences at the University of British Columbia.
The model is a vertical,
one-dimensional,
coupled physics-biology model for deep estuaries.
It is a local model of the lower trophic-level ecology and
carbon/oxygen/nitrogen cycles that is based on a simplified,
but accurate,
physical model of coastal regions.
SOG is being used to investigate the processes that determine primary
productivity and carbon fluxes.

If you are interested
in the model check out Susan's publications,
and if you are interested in collaborating on the code,
contact Susan and maybe something can be worked out.

.. _Dr. Susan Allen's: http://www.eos.ubc.ca/~sallen/

I did a major refactoring of the codebase during our sabbatical in 2006
and I continue to provide software engineering support for its development,
and occasionally work on improvements and new features.
I maintain the SOG version control repository,
and the `SOG buildbot`_ cluster that we use for regression testing.

.. _SOG buildbot: http://bjossa.eos.ubc.ca:8010/

SOG is also one of the concrete,
non-trivial,
examples that I use to think about and experiment with automated
software testing in the context of scientific computation.
Sadly,
apart from the buildbot regression testing,
I haven't come up with anything that makes me happy enough to share.


Strait of Georgia Bloomcast
---------------------------

In late 2011 we started running SOG as an operational model to predict the
first spring bloom in the Strait of Georgia.
The model is run daily,
driven by a combination of past actual forcing data and averaged future
forcing data.
For a given day's run the meteorological and river flows forcing data
are collected from Environment Canada web services.
Those data typically lag the run date by 2 to 4 days.
The forcing data for the period from the end of the actual past data to the
end of run are taken from 3 time series collections:

* Averaged values over the 42 year period from 1968 to 2010.
  Those years were the subject of the spring diatom bloom hindcast study
  reported in Allen and Wolfe, 2012 [#]_.

* Data from 1992/93,
  chosen because 1993 had the earliest predicted bloom in the
  Allen and Wolfe, 2012 hindcast study.

* Data from 1998/99,
  chosen because 1999 was tied for the latest predicted bloom in the
  Allen and Wolfe, 2012 hindcast study.

.. [#] Allen, S. E. and M. A. Wolfe, in press. Hindcast of the Timing of the Spring Phytoplankton Bloom in the Strait of Georgia, 1968-2010. Prog. Oceanogr. Accepted for publication.

The bloomcast results are available at
http://www.eos.ubc.ca/~sallen/SoG-bloomcast/results.html
That page is updated daily between 1-October and 30-April.
Between 1-May ad 30-September it shows the results of the previous spring's
bloomcast runs.

In the course of the 2011/2012 bloomcast prediction runs it was found that
the correlation algorithm used to transform sky descriptions to cloud fraction
forcing values was resulting in lower than actual cloud fraction values.
That caused the predicted bloom date to be too early.
That issue has been addressed with a new cloud fraction mapping that is based
on an analysis of weather descriptions and cloud fraction values reported by
Environment Canada over the 2002 through 2011 period.

The bloomcast driver has recently been modified to take advantage of multi-core
processors by running the 3 model calculations concurrently.

The bloomcast driver is written in Python.
It uses the requests_ library to collect the forcing data from the
Environment Canada web services.
The results page is rendered from a Mako_ template.
It incorporates profile and time series graphs that are created using
matplotlib_ and rendered as SVG images.
The HTML and CSS are based on `HTML5 Boilerplate`_.

.. _requests: http://pypi.python.org/pypi/requests
.. _Mako: http://pypi.python.org/pypi/Mako/
.. _matplotlib: http://matplotlib.sourceforge.net/
.. _HTML5 Boilerplate: http://html5boilerplate.com/


SOG Command Processor
---------------------

Another SOG-related project that I have recently implemented is a command
processor wrapper written in Python.
The current release of the tool provides an automated input file editing
feature that simplifies the preparation of large collections of runs for
sensitivity analyses,
genetic algorithm parameters optimization,
etc.
This has enabled SOG users to craft batch run programs that execute in excess
of 100 runs in 24 hours on a cluster of multi-core Linux workstations.
Future plans for the SOG command processor include automating the execution of
batch runs,
initially on a per-workstation basis,
but ultimately providing queue manager and worker functionality to
automatically distribute batch runs across the workstation cluster.


Proprietary Projects
====================

I have developed a number of software tools for my employer, Nordion_:

* I-123 Datalogs
    A data logging system that monitors the operation of 3 production
    systems that produce I-123 radio-isotope via proton bombardment of
    enriched Xe-124 gas.
    Sensor data and active device states are logged from PLC in a
    MySQL_ database.
    A PHP web application provides trend graphs and status reports to
    users.

* IsoInfo
    A web application that provides
    planning, prediction, and data logging tools
    for production of Sr-82 via proton spallation of natural Mo
    targets.
    An irradiation model and web application implemented in PHP
    provide tools to plan irradiations to meet production demands,
    to analyze irradiations in progress,
    and to provide a basis for production yield calculations.
    Beam on target data is collected nightly from the TRIUMF_ 500 MeV
    cyclotron data logging system,
    stored in a MySQL_ database, and used in conjunction with the
    planned beam schedule to drive the irradiation model.

* ZSM
    A data logging system that monitors the state of a
    radio-pharmaceutical manufacturing cleanroom suite.
    Temperature,
    humidity,
    differential pressure,
    and non-viable particle counter
    data are logged from a collection of sensors by a LabVIEW_
    application and stored a MySQL_ database.
    A TurboGears_ web application provides
    trend graphs,
    alert logging and investigation,
    and sensor calibration management to users.

* Minerva
    A quality management system web application that manages quality
    system form data in conformance with various standards for
    pharmaceutical manufacturing.
    Minerva provides
    form creation,
    routing,
    and tracking functions with electronic signatures,
    as well as
    quality system performance metrics,
    and full-text searching.
    The web application is built on the Pylons_ framework,
    and CouchDB_ is used to provide the data persistence layer.

.. _Nordion: http://nordion.com/
.. _TRIUMF: http://www.triumf.ca/
.. _MySQL: http://www.mysql.com/
.. _LabVIEW: http://www.ni.com/labview/
.. _TurboGears: http://turbogears.org/
.. _Pylons: http://pylonshq.com/
.. _CouchDB: http://couchdb.apache.org/

</%self:filter>
</article>
