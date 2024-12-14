package main.org.moroz;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.Collections;
import java.util.ArrayList;

public class PuzzleServlet extends HttpServlet {
    private ArrayList<Integer> board;

    @Override
    public void init() {
        resetBoard();
    }

    private void resetBoard() {
        board = new ArrayList<>();
        for (int i = 1; i <= 15; i++) {
            board.add(i);
        }
        board.add(0); // 0 для порожньої клітинки
        Collections.shuffle(board);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("board", board);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("reset".equals(action)) {
            resetBoard();
        }
        response.sendRedirect(request.getContextPath() + "/puzzle");
    }
}