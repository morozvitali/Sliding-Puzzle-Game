<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <title>15 Puzzle</title>
    <style>
        .grid {
            display: grid;
            grid-template-columns: repeat(4, 60px);
            grid-template-rows: repeat(4, 60px);
            gap: 5px;
        }
        .cell {
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #add8e6;
            font-size: 24px;
            height: 60px;
            width: 60px;
        }
        .empty {
            background-color: #f0f0f0;
        }
    </style>
</head>
<body>
    <h1>15 Puzzle</h1>
    <div class="grid">
        <%
            ArrayList<Integer> board = (ArrayList<Integer>) request.getAttribute("board");
            for (int num : board) {
                if (num == 0) {
        %>
                    <div class="cell empty"></div>
        <%
                } else {
        %>
                    <div class="cell"><%= num %></div>
        <%
                }
            }
        %>
    </div>
    <form method="post">
        <button type="submit" name="action" value="reset">Reset</button>
    </form>
</body>
</html>