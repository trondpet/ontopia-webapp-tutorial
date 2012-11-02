<%--
	Index page containing a blog post index.
	
	Example code for http://www.topicobserver.com/blog/semantic-web/tm/2009/web-application-development-with-ontopia-part-3/
	
	@author Trond K. Pettersen
--%>
<%@ include file="/includes/global.jsp" %>
<template:insert template="/includes/template.jsp">
  <tolog:context topicmap='<%= pageContext.getServletContext().getInitParameter("tmid") %>'>

    <%@ include file="/includes/tolog.jsp"%>
  
    <template:put name="content">
	tester
      <tolog:foreach query="instance-of( $post, onto:Post),
                  tobs:publish-date( $post, $date)
                  order by $date desc
                  limit 10 ?">

        <h2>
          <a href="post.jsp?id=<tolog:id var='post' />">
            <tolog:out var="post" />
          </a>
        </h2>

        <div class="excerpt">
          <a href="post.jsp?id=<tolog:id var='post' />">
            <tolog:out query=" tobs:excerpt( %post%, $excerpt )? " escape="false" />
          </a>
        </div>

      </tolog:foreach>
    </template:put>

  </tolog:context>
</template:insert>