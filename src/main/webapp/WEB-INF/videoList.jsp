<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>영상 목록</title>
</head>
<body>
<h1>영상 목록</h1>
<%
    // DB 연결 정보
    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;
    String url = "jdbc:oracle:thin:@localhost:1521:xe";
    String user = "scott", pw = "tiger";

    // JDBC 드라이버 로딩
    Class.forName("oracle.jdbc.OracleDriver");

    // DB 연결
    con = DriverManager.getConnection(url, user, pw);

    // SQL문 실행
    String sql = "SELECT * FROM video_table";
    stmt = con.createStatement();
    rs = stmt.executeQuery(sql);

    // 영상 목록 출력
    while (rs.next()) {
        String videoUrl = rs.getString("video_url");
%>
<iframe width="560" height="315" src="<%=videoUrl%>" frameborder="0" allowfullscreen></iframe>
<br/><br/>
<%
    }

    // JDBC 자원 닫기
    rs.close();
    stmt.close();
    con.close();
%>
</body>
</html>