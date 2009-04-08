# Makefile for douglatornell.ca site development space

# Author: Doug Latornell
# Created: 2008-05-18
# Refactored: 2008-11-10

site:	index.html software/python/index.html \
	talks/PyCon2009VanPyZ/index.html PyCon2009VanPyZ

PyCon2009VanPyZ:	talks/PyCon2009VanPyZ/slides.txt
	rst2s5.py $< $(<D)/$(<F:.txt=.html)

SITE=webfaction:webapps/djl_static/
# SITE=webfaction:webapps/testbed_static/
sync: site
	rsync -av --include-from=rsync_list . ${SITE}

.PHONY: clean

clean:
	-rm -f index.html
	-rm -f software/python/index.html

.SUFFIXES: .txt .html
.txt.html:
	rst2html.py $< $@

# end of file
