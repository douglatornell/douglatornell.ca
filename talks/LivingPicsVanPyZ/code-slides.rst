.. -*- coding: utf-8 -*-

===========================================
Codeblock Slides for VanPyZ LivingPics Talk
===========================================

:Author: Doug Latornell <djl@douglatornell.ca>
:Date: 1 December 2009


LivingPics INI Config
=====================

.. code-block:: ini

  [Timing]
  noshowhrs = 4.0
  displaysecs = 10

  [Exclusion List]
  exclusionlist = ./exclusion_list.txt

  [Image Sources]
  defaultsource = /Users/doug/Pictures/iPhoto Library/Originals
  imagesources = /Users/doug/Pictures/iPhoto Library/Originals, ""
	  /Users/doug/Pictures/iPhoto Library/Modified/2006/Big Island of Hawaii, ""
	  /Users/doug/Pictures/iPhoto Library/Originals/2005, ""
	  http://www.flickr.com/photos/sada_images/, "Our flickr Stream"

  [Image Selection]
  probofjump = 0.05
  rangeincr = 20
  rangedecr = -10


LivingPics YAML Config
======================

.. code-block:: yaml

   exclude_file: exclusions.yaml
   img_selection:
     prob_of_jump: 0.05
     range_decr: -10
     range_incr: 20
   img_srcs:
     current_src: /Users/doug/Pictures/iPhoto Library/Originals
     stored_srcs:
     - nickname: null
       src: /Users/doug/Pictures/iPhoto Library/Originals
     - nickname: Our flickr Stream
       src: http://www.flickr.com/photos/sada_images/
     - nickname: Spectacular Landscapes
       src: http://www.flickr.com/groups/spectacular_landscapes/
   timing:
     display_secs: 10
     no_show_hrs: 4.0


LivingPics ConfigMgr
====================

.. code-block:: python

   class ConfigMgr(object):
       def __init__(self, config_file):
	   """Create a ConfigMgr instance and populate its attributes
	   from the specified config_file.
	   """
	   self.config_file = config_file
	   with open(config_file, 'r') as fp:
	       config = yaml.load(fp)
	   for attr in 'timing exclude_file img_selection img_srcs'.split():
	       self.__setattr__(attr, config[attr])


       def write(self):
	   """Write the current configuration to the config file.
	   """
	   config = dict()
	   for attr in 'timing exclude_file img_selection img_srcs'.split():
	       config[attr] = self.__getattribute__(attr)
	   with open(self.config_file, 'w') as fp:
	       yaml.dump(config, stream=fp, default_flow_style=False)


LivingPics Flickr Authentication
================================

.. code-block:: python

   # Authenticate against Flickr for images from there
   self.API_key = 'fa18ca8d7c3e26db39603c76b954e2e5'
   API_secret = '11250ed1b6972348'
   self.flickr = FlickrAPI(self.API_key, API_secret)
   try:
       token, frob = self.flickr.get_token_part_one()
       if not token:
	   raw_input('Press ENTER after you authorize LivingPics '
		     'on Flickr')
       self.flickr.get_token_part_two((token, frob))
   except IOError:
       print 'Warning: Unable to connect to Flickr'


flickapi Examples
=================

.. code-block:: python

    def build_list_from_photostream(self, img_src):
        """Build the image list from a Flickr photostream.
        """
        resp = self.flickr.urls_lookupUser(api_key=self.API_key, url=img_src)
        user_id = resp.find('user').attrib['id']
        self.build_list_from_flickr(self.flickr_photos_search, user_id)


    def build_list_from_group(self, img_src):
        """Build the image list from a Flickr pool.
        """
        resp = self.flickr.urls_lookupGroup(api_key=self.API_key, 
                                            url=img_src)
        group_id = resp.find('group').attrib['id']
        self.build_list_from_flickr(self.flickr_groups_pools_getPhotos,
                                    group_id)



..
  Local Variables:
  mode: auto-fill
  mode: rst
  End:
