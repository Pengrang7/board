<%@ page import="com.codingrecipe.board.dto.BoardDTO" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    List<BoardDTO> boardList = (List<BoardDTO>) request.getAttribute("boardList");
%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>list</title>
    <!-- Add Bootstrap CSS link -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">
        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>id</th>
                    <th>title</th>
                    <th>writer</th>
                    <th>date</th>
                    <th>hits</th>
                </tr>
            </thead>
            <tbody>
                <% for (BoardDTO board : boardList) { %>
                <tr>
                    <td><%= board.getId() %></td>
                    <td><a href="/board/<%= board.getId() %>"><%= board.getBoardTitle() %></a></td>
                    <td><%= board.getBoardWriter() %></td>
                    <td><%= board.getBoardCreatedTime() %></td>
                    <td><%= board.getBoardHits() %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>
