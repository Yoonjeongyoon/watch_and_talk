<%@ page import="java.sql.*, javax.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>검색 결과</title>
</head>
<body>
<%
    // 데이터베이스 설정
    String url = "jdbc:mysql://34.64.140.75:5800/whatchandtalk"; // 데이터베이스 URL
    String user = "root1"; // 데이터베이스 사용자명
    String password = "homis509*"; // 데이터베이스 비밀번호
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        // 데이터베이스 연결
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);

        // 검색어 받아오기
        String searchQuery = request.getParameter("search");

        // SQL 쿼리 준비
        String sql = "SELECT * FROM chatroom WHERE title LIKE ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, "%" + searchQuery + "%");
        // 쿼리 실행 및 결과 처리
        rs = pstmt.executeQuery();

        while(rs.next()) {
            // 여기서 데이터베이스에서 가져온 데이터를 화면에 표시
            String title = rs.getString("title");

            // 추가적인 필드를 표시하려면 여기에 코드 추가
        }
    } catch(Exception e) {
        e.printStackTrace();
    } finally {
        // 자원 해제
        if(rs != null) try { rs.close(); } catch(SQLException ex) {}
        if(pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
        if(conn != null) try { conn.close(); } catch(SQLException ex) {}
    }
%>
</body>
</html>