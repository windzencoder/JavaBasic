<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage=""%>
<jsp:useBean id="connection" scope="request" class="com.dao.JDBConnection" />
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK">
		<title>��ֹ�ظ�ͶƱ������ͶƱϵͳ</title>
	</head>
	<link href="css/style.css" type="text/css" rel="stylesheet">
	<body>
		<%
			if (session.getAttribute("id")!=null) {
				out.print("<script type='text/javascript'>"
						+ "alert('���Ѿ�Ͷ��Ʊ�ˣ��벻Ҫ����ͶƱ��лл��');"
						+ "window.location.href = 'show.jsp'" + "</script>");
			} else {
		%>
		<div align="center">
			<br>
			<table width="400" height="37" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td background="image/review.gif">
						&nbsp;
					</td>
				</tr>
			</table>
			<table width="400" height="36" border="0" cellpadding="0"
				cellspacing="0">
				<tr>
					<td height="30">
						���Ա���˾���˽�?
					</td>
				</tr>
			</table>
			<!-- ���� -->
			<form name="form" method="post" action="result.jsp">
			<table width="400" cellpadding="0" cellspacing="0">
					<%
						String sql = "select * from vote_online order by id";
						ResultSet rs = connection.executeQuery(sql);
						try {
							while (rs.next()) {
					%>
				
				<tr align="center">
					<td height="30">
						<div align="left">
							<input type="radio" name="id" value="<%=rs.getString("id")%>">
							<%=rs.getString("name")%>
						</div>
					</td>
				</tr>
				<%
					}
						} catch (Exception e) {
							e.printStackTrace();
						}finally{
							connection.closeConnection();
						}
				%>
				<tr align="center">
					<td height="38">
						<div align="left">
							<input type="submit" name="Submit" value="��ҪͶƱ">&nbsp;
							<input type="button" name="Submit2" value="ͶƱ���"
								onclick="onClick=window.location.href ='show.jsp'">
						</div>
					</td>
				</tr>
				</table>
			</form>
			
		</div>
		<%
			}
		%>
	</body>
</html>