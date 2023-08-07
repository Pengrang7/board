<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>글작성</title>
    <!-- Add Bootstrap CSS link -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
    <h3 class="text-center">글작성</h3>
    <form action="/board/save" method="post" enctype="multipart/form-data">
        <table class="table table-bordered" style="width: 700px; margin: auto">

            <tr>
                <td width="70" class="bg-primary text-white">제목</td>
                <td><input type="text" name="boardTitle" class="form-control" /></td>
            </tr>

            <tr>
                <td width="70" class="bg-primary text-white">작성자</td>
                <td><input type="text" name="boardWriter" class="form-control" /></td>
            </tr>

            <tr>
                <td width="70" class="bg-primary text-white">비밀번호</td>
                <td><input type="text" name="boardPass" class="form-control" /></td>
            </tr>

            <tr>
                <td class="bg-primary text-white">내용</td>
                <td><textarea name="boardContents" cols="30" rows="10" class="form-control"></textarea></td>
            </tr>

            <tr>
                <td width="70" class="bg-primary text-white">첨부</td>
                <td><input type="file" name="boardFile" class="form-control-file" /></td>
            </tr>

            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="등록" class="btn btn-primary" />
                </td>
            </tr>

        </table>
    </form>
</div>
</body>
</html>
