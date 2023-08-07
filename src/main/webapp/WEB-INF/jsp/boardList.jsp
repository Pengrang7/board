<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Board List</title>
</head>
<body>
    <h1>게시판 목록</h1>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>작성자</th>
                <th>제목</th>
                <th>조회수</th>
                <th>작성 시간</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="board" items="${boardPage.content}">
                <tr>
                    <td>${board.id}</td>
                    <td>${board.boardWriter}</td>
                    <td>${board.boardTitle}</td>
                    <td>${board.boardHits}</td>
                    <td>${board.createdTime}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <div>
        <c:if test="${not boardPage.first}">
            <a href="?page=0">처음</a>
        </c:if>
        <c:if test="${boardPage.hasPrevious}">
            <a href="?page=${boardPage.number - 1}">이전</a>
        </c:if>
        <c:if test="${boardPage.hasNext}">
            <a href="?page=${boardPage.number + 1}">다음</a>
        </c:if>
        <c:if test="${not boardPage.last}">
            <a href="?page=${boardPage.totalPages - 1}">마지막</a>
        </c:if>
    </div>
</body>
</html>
