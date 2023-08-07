<%@ page import="com.codingrecipe.board.dto.BoardDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>글수정</title>
    <!-- Add Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        /* Add a gray background */
        body {
            background-color: #f8f9fa;
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <form action="/board/update" method="post">
            <table class="table table-bordered mx-auto" style="max-width: 700px;">
                <input type="hidden" name="id" value="${boardUpdate.id}" />
                <tr>
                    <td><label for="boardTitle">Title:</label></td>
                    <td><input type="text" name="boardTitle" id="boardTitle" class="form-control" value="${boardUpdate.boardTitle}" /></td>
                </tr>
                <tr>
                    <td><label for="boardWriter">Writer:</label></td>
                    <td><input type="text" name="boardWriter" id="boardWriter" class="form-control" value="${boardUpdate.boardWriter}" readonly /></td>
                </tr>
                <tr>
                    <td><label for="boardContents">Contents:</label></td>
                    <td><textarea name="boardContents" id="boardContents" class="form-control" cols="50" rows="5">${boardUpdate.boardContents}</textarea></td>
                </tr>
                <tr>
                    <td><label for="boardPass">Password:</label></td>
                    <td><input type="password" name="boardPass" id="boardPass" class="form-control" /></td>
                </tr>
                <tr>
                    <td colspan="2" class="text-center"><input type="submit" value="Modify" class="btn btn-primary" /></td>
                </tr>
            </table>
        </form>
    </div>
    <!-- Add Bootstrap JS -->
    <script>
        document.querySelector("form").addEventListener("submit", function(event) {
            const pass = document.getElementById("boardPass").value;
            const inputPass = "${boardUpdate.boardPass}";
            if (pass !== inputPass) {
                event.preventDefault();
                alert("비밀번호가 일치하지 않습니다! 수정할 수 없습니다.");
            }
        });
    </script>
</body>
</html>
