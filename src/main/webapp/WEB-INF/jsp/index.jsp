<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>index</title>
    <!-- Add the Bootstrap CSS link -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Specify Korean font (e.g., Nanum Gothic, Noto Sans CJK KR) -->
    <style>
        body {
            font-family: 'Nanum Gothic', 'Noto Sans CJK KR', sans-serif;
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <button class="btn btn-primary" onclick="saveReq()">글 작성</button>
        <a href="/board/save" class="btn btn-secondary">새 글 쓰기</a>
        <button class="btn btn-info" onclick="listReq()">목록 보기</button>
        <button class="btn btn-success" onclick="pagingReq()">페이징</button>
    </div>
</body>
<script>
    const saveReq = () => {
        location.href = "/board/save";
    }

    const listReq = () => {
        location.href = "/board/";
    }

    const pagingReq = () => {
        location.href = "/board/paging";
    }
</script>
</html>
