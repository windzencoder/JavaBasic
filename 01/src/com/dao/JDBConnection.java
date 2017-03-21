package com.dao;

import java.sql.*;

public class JDBConnection {
    private final String dbDriver = "com.mysql.jdbc.Driver"; 
    private final String url = "jdbc:mysql://localhost:3306/vote_online";
    private final String userName = "root";
    private final String password = "123456";
    private Connection con = null;

    public JDBConnection() {
        try {
            Class.forName(dbDriver).newInstance();
        } catch (Exception ex) {
            System.out.println("出现异常");
        }
    }

    /*
     * 创建连接
     */
    public boolean creatConnection() {
        try {
            con = DriverManager.getConnection(url, userName, password);
            con.setAutoCommit(true);

        } catch (SQLException e) {
            System.out.println(e.getMessage());
            System.out.println("creatConnectionError!");
        }
        return true;
    }

    public boolean executeUpdate(String sql) {

        if (con == null) {
            creatConnection();
        }
        try {
            Statement stmt = con.createStatement();
            int iCount = stmt.executeUpdate(sql);
            System.out.println("执行更新成功：" + String.valueOf(iCount));
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            System.out.println("executeUpdaterError!");
        }
        return true;
    }

    public ResultSet executeQuery(String sql) {
        ResultSet rs;
        try {
            if (con == null) {
                creatConnection();
            }
            Statement stmt = con.createStatement();
            try {
                rs = stmt.executeQuery(sql);
            } catch (SQLException e) {
                System.out.println(e.getMessage());
                return null;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            System.out.println("executeQueryError!");
            return null;
        }
        return rs;
    }

    /*
     * 关闭连接
     */
    public void closeConnection() {
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace(); //To change body of catch statement use File | Settings | File Templates.
                System.out.println("Failed to close connection!");
            } finally {
                con = null;
            }
        }
    }

}
