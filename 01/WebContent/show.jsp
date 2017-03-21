<%@ page contentType="text/html; charset=GBK" import="java.sql.*" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>禁止重复投票的在线投票系统</title>
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
      <td width="122" height="33"><div align="left">序号 </div></td>
      <td width="138"><div align="center">投票百分比</div></td>
      <td width="121"><div align="center">投票人数</div></td>
    </tr>
    <%
		String selectNumberSql="select sum(number) as number from vote_online";//生成计算总投票人数的SQL语句
		ResultSet ret=connection.executeQuery(selectNumberSql);//执行SQL语句，获取结果集
		String strNumber="";//声明用于保存投票人数的变量
		while(ret.next()){
    		strNumber=ret.getString("number");	//获取总投票人数
  		}
		ResultSet rs=connection.executeQuery("select * from vote_online order by id");//查询数据表
		while(rs.next()){
			float singleNumber=Float.parseFloat(rs.getString("number"));//当前项的票数
			float allNumber=Float.valueOf(strNumber);					//总投票人数
			float result=singleNumber/allNumber*100;					//计算出百分比
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
      <td>共有[<%=strNumber%>]人参加投票</td>
    </tr>
  </table>
</div>
</body>
</html>
