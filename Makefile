# Makefile for douglatornell.ca site development space

# Author: Doug Latornell
# Created: 2008-05-18
# Refactored: 2008-11-10

site:	index.html \
	projects.html \
	talks/index.html \
	PyCon2009VanPyZ \
	software/python/index.html \
	nosy

index.html:	index.txt html4css1.css site.css
	rst2html.py --link-stylesheet --stylesheet=html4css1.css,site.css \
		--generator --date \
		index.txt index.html
	python add_openid.py < index.html > tmp.html; mv tmp.html index.html

talks/index.html:	talks/index.txt html4css1.css site.css
	rst2html.py --link-stylesheet --stylesheet=../html4css1.css,../site.css \
		--generator --date \
		talks/index.txt talks/index.html

PyCon2009VanPyZ:	talks/PyCon2009VanPyZ/slides.txt
	rst2s5.py $< $(<D)/$(<F:.txt=.html)

nosy:
	(cd software/python/Nosy && \
	hg pull --update && \
	make)

SITE=webfaction:webapps/djl_static/
# SITE=webfaction:webapps/testbed_static/
rsync: site
	rsync -ahv --delete --include-from=rsync_list . ${SITE}

.PHONY: clean nosy

clean:
	-rm -f index.html
	-rm -f software/python/index.html

.SUFFIXES: .txt .html
.txt.html:
	rst2html.py --link-stylesheet --stylesheet=html4css1.css,site.css \
		--generator --date $< $@

# end of file
