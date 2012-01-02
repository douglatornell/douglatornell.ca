<%inherit file="_templates/site.mako" />
<article class="page_box">
<%self:filter chain="rst">

===================
 Software Projects
===================

Open source projects that I have contributed to (patches, docs, bug
reports, etc.):

* buildbot_
* couchdbkit_
* `Python Documentation`_
* sphinx_
* `turbogears 2`_
* virtualenvwrapper_
* webtest_

.. _buildbot: http://buildbot.net/
.. _couchdbkit: http://couchdbkit.org/
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


Personal Projects That I Have Released
======================================

* nosy_
    Run the nose test discovery and execution tool whenever a
    source file is changed (`nosy repository on bitbucket`_)

* randopony_
    A Django project for online data management activities
    for the BC Randonneurs Cycling Club (`randopony repository on bitbucket`_)

.. _nosy: http://douglatornell.ca/software/python/Nosy/
.. _nosy repository on bitbucket: https://bitbucket.org/douglatornell/nosy/overview
.. _randopony: http://randopony.sadahome.ca/
.. _randopony repository on bitbucket: https://bitbucket.org/douglatornell/randopony/overview


SOG Coupled Biology & Physics Model of Deep Estuaries
=====================================================

SOG is a research model developed by `Dr. Susan Allen's`_ coastal
oceanography group in the Department of Earth and Ocean Sciences at
the University of British Columbia. If you are interested in the model
check out Susan's publications, and if you are interested in
collaborating on the code, contact Susan and maybe something can be
worked out. 

.. _Dr. Susan Allen's: http://www.eos.ubc.ca/~sallen/

I did a major refactoring of the codebase during our sabbatical in
2006 and I continue to provide software engineering support for its
development, and occasionally work on improvements and new
features. I maintain the SOG version control repository, and the `SOG
buildbot`_ cluster that we use for regression testing.

.. _SOG buildbot: http://bjossa.eos.ubc.ca:8010/

SOG is also the concrete, non-trivial example that I use to think
about and experiment with automated software testing in the context of
scientific computation. Sadly, apart from the buildbot regression
testing, I haven't come up with anything that makes me happy enough to
share.


Proprietary Projects
====================

I have developed a number of software tools for my employer, Nordion_:

* I-123 Datalogs
    A data logging system that monitors the operation of 3 production
    systems that produce I-123 radio-isotope via proton bombardment of
    enriched Xe-124 gas. Sensor data and active device states are
    logged from PLC in a MySQL_ database. A PHP web application
    provides trend graphs and status reports to users.

* IsoInfo
    A web application that provides planning, prediction, and data
    logging tools for production of Sr-82 via proton spallation of
    natural Mo targets. An irradiation model and web application
    implemented in PHP provide tools to plan irradiations to meet
    production demands, to analyze irradiations in progress, and to
    provide a basis for production yield calculations. Beam on target
    data is collected nightly from the TRIUMF_ 500 MeV cyclotron data
    logging system, stored in a MySQL_ database, and used in
    conjunction with the planned beam schedule to drive the
    irradiation model.

* ZSM
    A data logging system that monitors the state of a
    radio-pharmaceutical manufacturing cleanroom suite. Temperature,
    humidity, differential pressure, and non-viable particle counter
    data are logged from a collection of sensors by a LabVIEW_
    application and stored a MySQL_ database. A TurboGears_ web
    application provides trend graphs, alert logging and
    investigation, and sensor calibration management to users.

* Minerva
    A quality management system web application that manages quality
    system form data in conformance with various standards for
    pharmaceutical manufacturing. Minerva provides form creation,
    routing, and tracking functions with electronic signatures, as
    well as quality system performance metrics, and full-text
    searching. The web application is built on the Pylons_ framework,
    and CouchDB_ is used to provide the data persistance layer.

.. _Nordion: http://nordion.com/
.. _TRIUMF: http://www.triumf.ca/
.. _MySQL: http://www.mysql.com/
.. _LabVIEW: http://www.ni.com/labview/
.. _TurboGears: http://turbogears.org/
.. _Pylons: http://pylonshq.com/
.. _CouchDB: http://couchdb.apache.org/

</%self:filter>
</article>
