<%@ page import="com.codingrecipe.board.dto.BoardDTO" %>
<%@ page import="org.springframework.data.domain.Page" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    BoardDTO board = (BoardDTO) request.getAttribute("board");
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>detail</title>
    <!-- Add Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- jquery cdn -->
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
    <!-- Custom CSS -->
    <style>
        .btn {
            color: #ffffff; /* Set button text color to white */
            background-color: gray; /* Set button background color to gray */
            padding: 8px 16px; /* Set padding for buttons (adjust as needed) */
            font-size: 14px; /* Set font size for buttons (adjust as needed) */
            border: none; /* Remove button border */
            border-radius: 4px; /* Add border-radius to make buttons slightly rounded */
            cursor: pointer; /* Show pointer cursor on hover */
        }

        .btn-primary {
            background-color: gray; /* Override default primary button color with gray */
        }

        /* You can create additional button classes for different sizes if needed */
        .btn-small {
            padding: 4px 8px; /* Smaller button size */
            font-size: 12px; /* Smaller font size */
        }

        .btn-large {
            padding: 12px 24px; /* Larger button size */
            font-size: 16px; /* Larger font size */
        }

        /* Custom separator style */
        .custom-separator {
            color: lightgray;
            margin: 0 6px;
        }

        /* Add space above the title */
        h2 {
            margin-top: 20px;
        }
            .comment-line {
                border-bottom: 1px solid #ccc;
                margin-bottom: 10px;
                margin-top: 10px;
            }
            .comment-writer {
                font-weight: bold;
                font-size: 16px;
            }
            .comment-time {
                color: lightgray;
                font-size: 6px;
            }
            .folded-comment {
                    display: none;
                }
    </style>
</head>
<body>
<div class="container">
    <h2><%= board.getBoardTitle() %></h2>
    <div style="display: flex;">
        <td>작성자: <%= board.getBoardWriter() %></td>
        <span class="custom-separator">|</span>
        <td>조회수: <%= board.getBoardHits() %></td>
        <span class="custom-separator">|</span>
        <td>등록일: <%= board.getBoardCreatedTime() %></td>
    </div>
    <hr>

    <table style="width: 100%;">
        <tr>
            <td colspan="10" style="text-align: left;"><%= board.getBoardContents() %></td>
        </tr>
    </table>

<br><br><br>
<div style="text-align: right;">
    <button class="btn btn-small btn-primary" onclick="listReq()">목록</button>
    <button class="btn btn-small btn-primary" onclick="updateReq()">수정</button>
    <button class="btn btn-small btn-primary" onclick="deleteReq()">삭제</button>
</div>

<!-- Add a gap of 10 pixels both above and below the straight line -->
<div style="text-align: center; margin-top: 10px; margin-bottom: 10px; border-bottom: 1px solid #ccc;"></div>

<!-- 댓글 출력 부분 -->
<div id="comment-list">
    <div style="text-align: left;">
        <table style="width: 700px; display: flex; margin-left: 10p;">
            <!-- Loop through the commentList and display each comment -->
            <c:forEach var="comment" items="${commentList}">
                <tr>
                    <th><span class="comment-writer"><c:out value="${comment.commentWriter}" /> </span></th>
                    <th><span class="custom-separator">|</span></th>
                    <th><span class="comment-time"><c:out value="${comment.commentCreatedTime}" /> </span></th>
                </tr>

                <tr>
                    <td><c:out value="${comment.commentContents}" /></td>
                </tr>

                <!-- Add a horizontal line after each comment -->
                <tr class="comment-line">
                    <td colspan="3"></td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>

<!-- 댓글 작성 부분 -->
    <div class="row">
        <div id="comment-write" class="col">
            <input type="text" id="commentWriter" class="form-control" placeholder="writer">
        </div>
        <div id="comment-time" class="col">
            <input type="text" id="commentContents" class="form-control" placeholder="contents">
        </div>
        <div class="col">
            <button id="comment-write-btn" class="btn btn-primary" onclick="commentWrite()">Write a comment</button>
        </div>
    </div>

    <!-- Add Bootstrap JS -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
    const commentWrite = () => {
        const writer = document.getElementById("commentWriter").value;
        const contents = document.getElementById("commentContents").value;
        console.log("작성자: ", writer);
        console.log("내용: ", contents);
        const id = <%= board.getId() %>;
        $.ajax({
           // 요청방식: post, 요청주소: /comment/save, 요청데이터: 작성자, 작성내용, 게시글번호
           type: "post",
           url: "/comment/save",
           data: {
               "commentWriter": writer,
               "commentContents": contents,
               "boardId": id
           },
           success: function (res) {
               console.log("요청성공", res);
               let output = "<table class='table table-bordered'>";
               output += "<th>작성자</th>";
               output += "<th>내용</th>";
               output += "<th>작성시간</th></tr>";
               for (let i in res) {
                   output += "<tr>";
                   output += "<td>" + res[i].commentWriter + "</td>";
                   output += "<td>" + res[i].commentContents + "</td>";
                   output += "<td>" + res[i].commentCreatedTime + "</td>";
                   output += "</tr>";
               }
               output += "</table>";
               document.getElementById('comment-list').innerHTML = output;
               document.getElementById('commentWriter').value = '';
               document.getElementById('commentContents').value = '';
           },
           error: function (err) {
               console.log("요청실패", err);
           }
        });
    }

        const listReq = () => {
            console.log("목록 요청");
            const page = ${page};
            location.href = "/board/paging?page=" + page;
        }
        const updateReq = () => {
            console.log("수정 요청");
            const id = ${board.id};
            location.href = "/board/update/" + id;
        }
        const deleteReq = () => {
            console.log("삭제 요청");
            const id = ${board.id};
            location.href = "/board/delete/" + id;
        }
</script>
</body>
</html>
