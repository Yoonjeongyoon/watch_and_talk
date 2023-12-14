<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>영상 목록</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");

    String videoUrl = request.getParameter("videoUrl");

    // DB 연결 정보
    Connection con = null;
    PreparedStatement pstmt = null;
    String url = "jdbc:oracle:thin:@localhost:1521:xe";
    String user = "scott", pw = "1234";

    try {
        // JDBC 드라이버 로딩
        Class.forName("oracle.jdbc.OracleDriver");

        // DB 연결
        con = DriverManager.getConnection(url, user, pw);

        // SQL문 준비
        String sql = "INSERT INTO video_table (video_url) VALUES (?)";

        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, videoUrl);

        // 실행
        pstmt.executeUpdate();

        // JDBC 자원 닫기
        pstmt.close();
        con.close();
    }catch(Exception e){
        e.printStackTrace();
    }
%>
<script>
    alert("영상 정보 저장 성공!");
    location.href = 'insertForm.jsp';
</script>
</body>
</html>