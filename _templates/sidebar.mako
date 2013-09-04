<aside>
  <section>
    <h1 class="post_header_gradient theme_font">Latest Posts</h1>
    <ul>
      % for post in bf.config.blog.iter_posts_published(5):
      <li><a href="${post.path}">${post.title}</a></li>
      % endfor
    </ul>
  </section>

  <section>
    <h1 class="post_header_gradient theme_font">
      Images from <a href="http://www.flickr.com"><strong style="color:#3993ff">flick<span style="color:#ff1c92">r</span></strong></a>
    </h1>
    <table id="flickr_badge_wrapper" cellpadding="0" cellspacing="10" border="0">
      <script src="http://www.flickr.com/badge_code_v2.gne?show_name=1&count=3&display=random&size=m&layout=v&source=user&user=69997344%40N00"></script>
      <tr>
        <td id="flickr_badge_source" valign="center" align="center">
          <table cellpadding="0" cellspacing="0" border="0">
            <tr>
              <td id="flickr_icon_td" width="10">
                <a href="http://www.flickr.com/photos/sada_images/">
                  <img id="flickr_badge_icon" alt="Susan &amp;amp; Doug's Adventures' items" src="http://farm6.staticflickr.com/5538/buddyicons/69997344@N00_r.jpg?1371705782" align="left" width="48" height="48">
                </a>
              </td>
              <td id="flickr_badge_source_txt">
                <span class="nobr">Go to</span> <a href="http://www.flickr.com/photos/sada_images/">Susan &amp; Doug's Adventures' photostream</a>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
  </section>
</aside>
