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

      <tolog:context topicmap="blog_topic_map.xtm">

        <tolog:foreach query='

            using onto for i"http://psi.ontopedia.net/Blogging/"
            using tobs for i"http://example.topicobserver.com/psi/"
			
            instance-of( $post, onto:Post ),
            tobs:publish-date( $post, $date)
            order by $date desc
            limit 10?'
    >

            <h2>
              <a href="post.jsp?id=<tolog:oid var='post' />">
                <tolog:out var="post" />
              </a>
            </h2>

            <%-- may contain html, so we wrap it in a div instead of a p --%>
            <div class="excerpt">
              <a href="post.jsp?id=<tolog:id var='post' />">
                <tolog:out query='
					using tobs for i"http://example.topicobserver.com/psi/" 
					tobs:excerpt( %post%, $excerpt )? ' 
				/>
              </a>
            </div>

        </tolog:foreach>

      </tolog:context>

    </div>
  </body>
</html>