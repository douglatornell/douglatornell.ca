---
title: CSV Downloads from Web Apps
permalink: http://douglatornell.ca/blog/2012/02/09/csv-downloads-from-pylons
date: 2012/02/09 21:34:51
categories: Python, Pylons
guid: b'WUPeeI0uL1FcUOvi5z14kt_OpQ4='
---

One of the users of an intranet app I maintain was using copy/paste to
put data from the app into Excel. She asked if there was a better
way. The pages she was copying from have tables of datastore objects,
so adding a CSV download feature was an obvious solution. Providing
that feature turned out to be pretty easy with the help of the
StringIO_ and csv_ modules in the standard library.

.. _StringIO: http://docs.python.org/library/stringio.html
.. _csv: http://docs.python.org/library/csv.html

While the code below is from a Pylons controller class, I can't see it
being difficult to implement this in Django, Pyramid, or other web
framework stacks.

The request handler for the CSV download looks like::

  #!python
  import cString
  import csv

  def csv_download(self, ...):
      csv_buffer = cStringIO.StringIO()
      csv_writer = csv.writer(csv_buffer)
      header = self._build csv_header(...)
      csv_writer.writerow(header)
      query_result = self.get_data_for_csv(...)
      for result in query_result:
          row = self._build_csv_row(result)
          csv_writer.writerow(row)
      content = csv_buffer.getvalue()
      csv_buffer.close()
      response.content_type = 'text/csv; charset=utf-8'
      response.content_disposition = (
          'attachment; filename="your_file.csv"')
      return content

This method uses ``StringIO`` to set up a file-like memory buffer, and
instantiates a default CSV writer to write to the buffer. Next we
build the header row and write it to the buffer. Then we get an
iterator for the content that we want to write the the CSV file from
the datastore, and format and write it to the buffer, one line at a
time. Finally we get the CSV data from the buffer, set the response
headers appropriately, and return the CSV data for download.

One thing I'm uncertain about: Is it necessary to explicitly call
``close`` method on a ``StringIO`` instance, or could I just do::

  #!python
  return csv_buffer.getvalue()

and let garbage collection take care of releasing the memory allocated
for ``csv_buffer``?

To get Excel to play nice with UTF-8 encoded data it's necessary to
include 3 specific bytes as a Byte Order Mark (BOM) at the beginning
of the file. I did that by prepending them to the heading string for
the first column::

  #!python
  def _build_csv_header(self, ...)
      UTF_8_BOM = '\xef\xbb\xbf'
      header = [
          UTF_8_BOM + 'Column 1 Heading',
          ...
      ]
      return header

Building the content for each row of the CSV file is just a matter of
formatting each query result into an array of strings. Fields
containing non-ASCII characters stored as Unicode need to be encoded
to UTF-8::

  #!python
  def _build_csv_row(self, result)
      row = [
          result.column_1_value,
          '{:%Y-%m-%d}'.format(result.some_date)
          ...
          result.unicode_value.encode('utf-8'),
          ...
      ]
      return row

I had an additional complication to deal with. The data for one of the
CSV columns is stored in the database as HTML fragments that may
contain non-ASCII characters. That data had to be rendered to Unicode
before it could be added to the CSV row (encoded as UTF-8). It turns
out that the Python standard library provides a fairly painless way of
handling that complication too, but I'll leave that for another post.
