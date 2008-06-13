# Makefile for douglatornell.ca site development space

# Author: Doug Latornell
# Created: 2008-05-18

EHOSTING_PATH=douglatornell.ca/www
NETRC=login.cfg

HTML=index.html
upload-html:
	ncftpput -f $(NETRC) $(EHOSTING_PATH) $(HTML)

NOSY_PATH=software/python/nosy
NOSY=$(NOSY_PATH)/index.html $(NOSY_PATH)/nosy.py $(NOSY_PATH)/sample.cfg \
	$(NOSY_PATH)/Nosy-1.0.tar.gz
upload-nosy:
	ncftpput -m -f $(NETRC) $(EHOSTING_PATH)/$(NOSY_PATH) $(NOSY)

# end of file
