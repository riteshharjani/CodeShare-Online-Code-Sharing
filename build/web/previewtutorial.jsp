<%--
    Document   : register
    Created on : Dec 9, 2013, 12:49:49 PM
    Author     : aqfaridi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.sql.*,connection.Config" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>CodeShare</title>
<link rel="shortcut icon" type="image/x-icon" href="assets/favicon.ico"/>
<link href="style.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="assets/js/jquery.js"></script>
		<script type="text/javascript" src="assets/js/jquery-1.7.1.min.js"></script>
	
<style type="text/css">
         .navbar-inner{
			 background:#000;
			 border-bottom:5px solid #007AF4;
			 height:70px;

			 }
			.navbar-inner .brand{color:#FFF}

</style>
</head>

    <body>	<script type="text/javascript" src="assets/js/bootstrap-button.js"></script>
		<script type="text/javascript" src="assets/js/jquery.validate.min.js"></script>
                <script type="text/javascript" src="assets/js/bootstrap-tab.js"></script>
                <script type="text/javascript" src="assets/js/bootstrap-carousel.js"></script>
                <script type="text/javascript" src="assets/js/bootstrap-dropdown.js"></script>
                <script src="assets/js/bootstrap-collapse.js" type="text/javascript"></script>

                <script src="assets/js/bootstrap.js" type="text/javascript"></script>
                <script type="text/javascript" src="script1.js"></script>
 <%
    String User =(String) session.getAttribute("username");
//    out.print(User);
    if(User != null)
               {%>

        <%@include file="header1.jsp" %>
        <%  }
                else
                {%>
                 <%@ include file="header.jsp" %>
                 <% }
   %>
        <div class="container">
            <div class="row">

                <%


                    String id = request.getParameter("id");
                    Config c = new Config();
                    Connection con = c.getcon();
                    Statement st = con.createStatement();
                    String qry = "SELECT * FROM tutorials WHERE id='"+id+"'";
                    ResultSet rs = st.executeQuery(qry);

                    if(rs.next())
                    {

                        out.println("<center><h2>");
                        out.println("Tutorial Title: "+rs.getString("tutorialname")+"<br/>");
                        out.println("Tutorial Code: " + rs.getString("tutorialcode"));
                        out.println("</h2></center><br/>");
                        out.println(rs.getString("tutorialdescription")+"<br/>");

                        out.println("<p style = 'color:#808080;font-weight:bold;' > Added By : <a>"+rs.getString("author")+"</a> "+rs.getString("time")+" </p><br/>");
                    }
                    %>

           <br/><br/>

           </div><br/><br/>
           <%
                qry = "SELECT * FROM commenttutorials WHERE tid='"+id+"' ORDER BY Sno DESC";
                rs = st.executeQuery(qry);
                while(rs.next())
                {
           %>
           <p>
               <img src="assets/img/profile.png" height="50px" width="50px" alt="profile" />
               <b><a href="#"><%=rs.getString("username")%></a></b>
                 <b style="color:#808080;"><%=rs.getString("time")%></b>

                <pre><%=rs.getString("comment")%></pre>
           </p>
           <br/>
           <%}
                if(User!=null)
               {
                %>
           <h2 style="color:#3399CC;">Leave a Comment</h2>
           <form action="commenttut?id=<%=id%>" method="post">
               <textarea  name="comment" class="span9" onkeyup="this.rows = (this.value.split('\n').length||1);" autocomplete="off" role="textbox" placeholder="Write your comment here ... " title="sourcecodes" name="codes" required></textarea>
               <br/><button type="submit" class="btn btn-success btn-large">Post Comment</button>
           </form>
               <%}

               con.close();
 %>
     <br/><br/>
        </div>
           <br/><br/>
  <%@include file="footer.jsp" %>
    </body>
</html>
