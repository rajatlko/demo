<%@page import="java.sql.*" %>
<%@include file="connection.jsp" %>
<%
if(session.getAttribute("email")==null)
{
	response.sendRedirect("login.jsp");
}
%>
<%!
String fname="",lname="",gen="",mob="",address="",pic="",ch="",ch1="";
%>
<%
ps=cn.prepareStatement("select * from signup where Email=?");
ps.setString(1,session.getAttribute("email")+"");
rs=ps.executeQuery();
if(rs.next())
{
	fname=rs.getString("FirstName");
	lname=rs.getString("LastName");
	gen=rs.getString("Gender");
	mob=rs.getString("Mobile");
	address=rs.getString("Address");
	pic=rs.getString("Pic");
	if(gen.equals("Male"))
	{
		ch1="";
		ch="checked";
	}
	else
	{
		ch="";
		ch1="checked";
	}
}

if(request.getParameter("btnupdate")!=null)
{
	ps=cn.prepareStatement("update signup set FirstName=?,LastName=?,Gender=?,Mobile=?,Address=? where Email=?");
	ps.setString(1,request.getParameter("tfname")+"");
	ps.setString(2,request.getParameter("tlname")+"");
	ps.setString(3,request.getParameter("gen")+"");
	ps.setString(4,request.getParameter("tmobile")+"");
	ps.setString(5,request.getParameter("taddress")+"");
	ps.setString(6,session.getAttribute("email")+"");
	ps.executeUpdate();
	response.sendRedirect("welcome.jsp");
	
	
}

%>
<html>
<head>
<link rel="stylesheet" href="bootstrap.min.css" />
  <script src="jquery.min.js"></script>
  <script src="bootstrap.min.js"></script>
</head>
<body>
<form method="post">
  <%@include file="header.jsp" %>
	
		<div class="row">
			<div class="col-sm-3">
				<%@include file="left.jsp"%>
			</div>
			<div class="col-sm-9">
				<div class="row">
					<div class="col-sm-3"><h3>First Name</h3></div>
					<div class="col-sm-9"><input class="form-control" type="text" name="tfname" value="<%=fname%>" /></div>
				</div>
				<div class="row">
					<div class="col-sm-3"><h3>Last Name</h3></div>
					<div class="col-sm-9"><input class="form-control" type="text" name="tlname" value="<%=lname%>" /></div>
				</div>
				<div class="row">
					<div class="col-sm-3"><h3>Mobile</h3></div>
					<div class="col-sm-9"><input class="form-control" type="text" name="tmobile" value="<%=mob%>" /></div>
			</div>
				<div class="row">
					<div class="col-sm-3"><h3>Gender</h3></div>
					<div class="col-sm-9">Male<input type="radio" value="Male" <%=ch%> name="gen" />Female<input type="radio" <%=ch1%> value="Female" name="gen" /></div>
				</div>
				<div class="row">
					<div class="col-sm-3"><h3>Email</h3></div>
					<div class="col-sm-9"><h3><%=session.getAttribute("email")%></h3></div>
				</div>
				<div class="row">
					<div class="col-sm-3"><h3>Address</h3></div>
					<div class="col-sm-9"><input class="form-control" type="text" name="taddress" value="<%=address%>" /></div>
				</div>
				<div class="row">
					<div class="col-sm-9"><input class="btn btn-primary" type="submit" name="btnupdate" value="Update" /></div>
				</div>
			</div>
		</div>
	</div>
	<div class="panel-footer">Designed By:ZN Infotech</div>
  </div>
</form>
</body>
</html>