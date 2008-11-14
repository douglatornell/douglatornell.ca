# Makefile for douglatornell.ca site development space

# Author: Doug Latornell
# Created: 2008-05-18
# Refactored: 2008-11-10

site:	index.html software/python/index.html

sync: site
	rsync -av --include-from=rsync_list . /tmp/djl_static/

.PHONY: clean

clean:
	-rm -f index.html
	-rm -f software/python/index.html

.SUFFIXES: .txt .html
.txt.html:
	rst2html ${.ALLSRC} ${.TARGET}

# end of file
