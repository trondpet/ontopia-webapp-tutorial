<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri='http://psi.ontopia.net/jsp/taglib/tolog' prefix='tolog'%>
<!DOCTYPE html>
  <head>
    <title>My Blog</title>
    <!-- some stylesheets and stuff here -->
  </head>
  <body>
    <!-- site navigation etc here -->
    <div id="content">

      <h1>My Blog</h1>

      <!-- sets the context of our tolog queries to the correct topic map -->
      <tolog:context topicmap="blog_topic_map.xtm">

        <!-- iterate through the 10 latest blog posts, sorted by date -->
        <tolog:foreach query='
		
			using onto for i"http://psi.ontopedia.net/Blogging/"
            using tobs for i"http://example.topicobserver.com/psi/"
            
			instance-of( $post, onto:Post ),
            tobs:publish-date( $post, $date)
            order by $date desc
            limit 10?'
			
		>

            <!-- output the name of the post -->
            <tolog:out var="post" /><br />

        </tolog:foreach>

      </tolog:context>
    </div>
  </body>
</html>