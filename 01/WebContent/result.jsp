<%@ page contentType="text/html; charset=GBK" import="java.sql.*"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK">
		<title>��ֹ�ظ�ͶƱ������ͶƱϵͳ</title>
	</head>
	<body>
		<jsp:useBean id="connection" scope="request" class="com.dao.JDBConnection" />
		<%
			String id = request.getParameter("id");//��ȡ�û�ѡ�������
			if (id == null) { //����û�û��ѡ��
				response.sendRedirect("index.jsp"); //������ҳ��
			} else {
				if (request.getSession().getAttribute("id") == null) {
					String sql = "update vote_online set number=number+1 where id='"
							+ id + "'";//����SQL���
					connection.executeUpdate(sql);//����ִ��SQL���ķ���
					connection.closeConnection();//�ر����ݿ�����
					session.setAttribute("id", id);//���û�ѡ������ݴ���session����
					response.sendRedirect("show.jsp");//��ת����ʾ���ҳ��
				} else {
					out.print("<script type='text/javascript'>");
					out.print("alert('���Ѿ�Ͷ��Ʊ�ˣ��벻Ҫ�ظ�ͶƱ��лл��');");
					out.print("window.locatiion='show.jsp';");
					out.print("</script>");
					response.sendRedirect("index.jsp"); //������ҳ��
				}
			}
		%>
	</body>
</html>