<%@ page contentType="text/html; charset=GBK" import="java.sql.*" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>��ֹ�ظ�ͶƱ������ͶƱϵͳ</title>
</head>
<link href="css/style.css" type="text/css" rel="stylesheet">
<body>
<div align="center"><br>
  <jsp:useBean id="connection" scope="request" class="com.dao.JDBConnection"/>
  <table width="373" height="37" cellpadding="0" cellspacing="0">
    <tr>
      <td background="image/vote_info.gif">&nbsp;</td>
    </tr>
  </table>
  <table width="373" height="57" cellpadding="0" cellspacing="0">
    <tr align="center">
      <td width="122" height="33"><div align="left">��� </div></td>
      <td width="138"><div align="center">ͶƱ�ٷֱ�</div></td>
      <td width="121"><div align="center">ͶƱ����</div></td>
    </tr>
    <%
		String selectNumberSql="select sum(number) as number from vote_online";//���ɼ�����ͶƱ������SQL���
		ResultSet ret=connection.executeQuery(selectNumberSql);//ִ��SQL��䣬��ȡ�����
		String strNumber="";//�������ڱ���ͶƱ�����ı���
		while(ret.next()){
    		strNumber=ret.getString("number");	//��ȡ��ͶƱ����
  		}
		ResultSet rs=connection.executeQuery("select * from vote_online order by id");//��ѯ���ݱ�
		while(rs.next()){
			float singleNumber=Float.parseFloat(rs.getString("number"));//��ǰ���Ʊ��
			float allNumber=Float.valueOf(strNumber);					//��ͶƱ����
			float result=singleNumber/allNumber*100;					//������ٷֱ�
  	%>
    <tr align="center">
      <td height="20"><div align="left"><%=rs.getString("id")%>.<%=rs.getString("name")%></div></td>
      <td><%=result%>%</td>
      <td><%=rs.getString("number")%></td>
    </tr>
    <%
    	}
		connection.closeConnection();
  	%>
  </table>
  <table width="373" height="24" cellpadding="0" cellspacing="0">
    <tr>
      <td>����[<%=strNumber%>]�˲μ�ͶƱ</td>
    </tr>
  </table>
</div>
</body>
</html>