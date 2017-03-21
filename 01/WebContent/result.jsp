<%@ page contentType="text/html; charset=GBK" import="java.sql.*"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK">
		<title>禁止重复投票的在线投票系统</title>
	</head>
	<body>
		<jsp:useBean id="connection" scope="request" class="com.dao.JDBConnection" />
		<%
			String id = request.getParameter("id");//获取用户选择的内容
			if (id == null) { //如果用户没有选择
				response.sendRedirect("index.jsp"); //返回首页面
			} else {
				if (request.getSession().getAttribute("id") == null) {
					String sql = "update vote_online set number=number+1 where id='"
							+ id + "'";//生成SQL语句
					connection.executeUpdate(sql);//调用执行SQL语句的方法
					connection.closeConnection();//关闭数据库连接
					session.setAttribute("id", id);//将用户选择的内容存入session对象
					response.sendRedirect("show.jsp");//跳转到显示结果页面
				} else {
					out.print("<script type='text/javascript'>");
					out.print("alert('你已经投过票了，请不要重复投票，谢谢！');");
					out.print("window.locatiion='show.jsp';");
					out.print("</script>");
					response.sendRedirect("index.jsp"); //返回首页面
				}
			}
		%>
	</body>
</html>
