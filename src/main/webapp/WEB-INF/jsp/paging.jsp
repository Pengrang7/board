<%@ page import="com.codingrecipe.board.dto.BoardDTO" %>
<%@ page import="org.springframework.data.domain.Page" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    Page<BoardDTO> boardList = (Page<BoardDTO>) request.getAttribute("boardList");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>게시판 목록</title>

    <!-- Add Bootstrap CSS link -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">

        <div class="text-center">
            <h1>게시판 목록</h1>
            <table class="table table-bordered table-striped" style="width: 700px; margin: auto">
                <tr>
                    <th style="width: 10%">번호</th>
                    <th style="width: 45%">제목</th>
                    <th style="width: 15%">작성자</th>
                    <th style="width: 15%">등록일</th>
                    <th style="width: 20%">조회수</th>
                </tr>
                <% for (BoardDTO board : boardList) { %>
                <tr>
                    <td><%= board.getId() %></td>
                    <td><a href="/board/<%= board.getId() %>?page=<%= boardList.getNumber() + 1 %>"><%= board.getBoardTitle() %></a></td>
                    <td><%= board.getBoardWriter() %></td>
                    <td><%= board.getBoardCreatedTime().format(java.time.format.DateTimeFormatter.ofPattern("yy-MM-dd")) %></td>
                    <td><%= board.getBoardHits() %></td>
                </tr>
                <% } %>
            </table>
        </div>

        <!-- Pagination -->
        <div class="text-center">
            <a href="/board/paging?page=1" class="btn btn-primary">First</a>
            <c:choose>
                <c:when test="${boardList.number > 1}">
                    <a href="/board/paging?page=${boardList.number - 1}" class="btn btn-primary">Previous</a>
                </c:when>
                <c:otherwise>
                     <a href="/board/paging?page=1" class="btn btn-primary" class="btn btn-primary">Previous</a>
                </c:otherwise>
            </c:choose>




            <button class="btn btn-primary" onclick="saveReq()">글작성</button>

            <c:choose>
                <c:when test="${not boardList.last}">
                    <a href="/board/paging?page=${boardList.number + 2}" class="btn btn-primary">Next</a>
                </c:when>
                <c:otherwise>
                    <a href="#" class="btn btn-primary" disabled>Next</a>
                </c:otherwise>
            </c:choose>
            <c:choose>
                <c:when test="${not boardList.last}">
                    <a href="/board/paging?page=${boardList.totalPages}" class="btn btn-primary">Last</a>
                </c:when>
                <c:otherwise>
                    <a href="#" class="btn btn-primary" disabled>Last</a>
                </c:otherwise>
            </c:choose>



        </div>
    </div>
</body>
<script>
    const saveReq = () => {
        location.href = "/board/save";
    }
</script>
</html>
