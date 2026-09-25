package servlet;

import java.io.IOException;
import java.util.List;

import dao.CategoryDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import model.Category;

@WebServlet("/categories")
public class CategoryServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private CategoryDAO categoryDAO;

    @Override
    public void init() {
        categoryDAO = new CategoryDAO();
    }

    // Display all categories
    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("new".equals(action)) {

            request.getRequestDispatcher("/category-form.jsp")
                   .forward(request, response);

        } else if ("edit".equals(action)) {

            int id = Integer.parseInt(
                    request.getParameter("id"));

            Category category = categoryDAO.getCategoryById(id);

            request.setAttribute("category", category);

            request.getRequestDispatcher("/category-form.jsp")
                   .forward(request, response);

        } else if ("view".equals(action)) {

            int id = Integer.parseInt(
                    request.getParameter("id"));

            Category category = categoryDAO.getCategoryById(id);

            request.setAttribute("category", category);

            request.getRequestDispatcher("/category-view.jsp")
                   .forward(request, response);

        } else if ("delete".equals(action)) {

            int id = Integer.parseInt(
                    request.getParameter("id"));

            categoryDAO.deleteCategory(id);

            response.sendRedirect(
                    request.getContextPath() + "/categories");

        } else {

            List<Category> categories =
                    categoryDAO.getAllCategories();

            request.setAttribute("categories", categories);

            request.getRequestDispatcher("/category-list.jsp")
                   .forward(request, response);
        }
    }

    // Add or update a category
    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String idParameter = request.getParameter("id");

        String name = request.getParameter("name");
        String description = request.getParameter("description");

        Category category = new Category();

        category.setName(name);
        category.setDescription(description);

        boolean success;

        if (idParameter == null || idParameter.isEmpty()) {

            // ADD
            success = categoryDAO.insertCategory(category);

        } else {

            // UPDATE
            int id = Integer.parseInt(idParameter);

            category.setId(id);

            success = categoryDAO.updateCategory(category);
        }

        if (success) {

            response.sendRedirect(
                    request.getContextPath() + "/categories");

        } else {

            response.getWriter().println(
                    "Failed to save category.");
        }
    }
}