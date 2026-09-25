package servlet;

import java.io.IOException;
import java.util.List;

import dao.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import model.Product;

@WebServlet("/products")
public class ProductServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private ProductDAO productDAO;

    @Override
    public void init() {
        productDAO = new ProductDAO();
    }

    // Display all products
    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("new".equals(action)) {

            request.getRequestDispatcher("/product-form.jsp")
                   .forward(request, response);

        } else if ("edit".equals(action)) {

            int id = Integer.parseInt(
                    request.getParameter("id"));

            Product product = productDAO.getProductById(id);

            request.setAttribute("product", product);

            request.getRequestDispatcher("/product-form.jsp")
                   .forward(request, response);

        } else if ("view".equals(action)) {

            int id = Integer.parseInt(
                    request.getParameter("id"));

            Product product = productDAO.getProductById(id);

            request.setAttribute("product", product);

            request.getRequestDispatcher("/product-view.jsp")
                   .forward(request, response);

        } else if ("delete".equals(action)) {

            int id = Integer.parseInt(
                    request.getParameter("id"));

            productDAO.deleteProduct(id);

            response.sendRedirect(
                    request.getContextPath() + "/products");

        } else {

            List<Product> products =
                    productDAO.getAllProducts();

            request.setAttribute("products", products);

            request.getRequestDispatcher("/product-list.jsp")
                   .forward(request, response);
        }
    }

    // Add a new product
    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String idParameter = request.getParameter("id");

        String name = request.getParameter("name");
        String sku = request.getParameter("sku");

        int categoryId = Integer.parseInt(
                request.getParameter("categoryId"));

        int supplierId = Integer.parseInt(
                request.getParameter("supplierId"));

        double unitPrice = Double.parseDouble(
                request.getParameter("unitPrice"));

        double costPrice = Double.parseDouble(
                request.getParameter("costPrice"));

        int quantity = Integer.parseInt(
                request.getParameter("quantity"));

        int reorderLevel = Integer.parseInt(
                request.getParameter("reorderLevel"));

        String description = request.getParameter("description");

        Product product = new Product();

        product.setName(name);
        product.setSku(sku);
        product.setCategoryId(categoryId);
        product.setSupplierId(supplierId);
        product.setUnitPrice(unitPrice);
        product.setCostPrice(costPrice);
        product.setQuantity(quantity);
        product.setReorderLevel(reorderLevel);
        product.setDescription(description);

        boolean success;

        if (idParameter == null || idParameter.isEmpty()) {

            // ADD
            success = productDAO.insertProduct(product);

        } else {

            // UPDATE
            int id = Integer.parseInt(idParameter);

            product.setId(id);

            success = productDAO.updateProduct(product);
        }

        if (success) {

            response.sendRedirect(
                    request.getContextPath() + "/products");

        } else {

            response.getWriter().println(
                    "Failed to save product.");
        }
    }
}