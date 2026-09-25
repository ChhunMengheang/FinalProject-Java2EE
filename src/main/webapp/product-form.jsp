<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    model.Product product =
        (model.Product) request.getAttribute("product");

    boolean editMode = product != null;
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>
        <%= editMode ? "Edit Product" : "Add Product" %>
    </title>

    <link rel="stylesheet" href="Style.css">

</head>

<body>

<div class="container">

    <h1>
        <%= editMode ? "Edit Product" : "Add New Product" %>
    </h1>

    <p>Computer Accessories Stock Management</p>

    <form action="products" method="post">

        <% if (editMode) { %>

            <input
                type="hidden"
                name="id"
                value="<%= product.getId() %>">

        <% } %>


        <label>Product Name:</label>

        <input
            type="text"
            name="name"
            value="<%= editMode ? product.getName() : "" %>"
            required>

        <br><br>


        <label>SKU:</label>

        <input
            type="text"
            name="sku"
            value="<%= editMode ? product.getSku() : "" %>"
            required>

        <br><br>


        <label>Category ID:</label>

        <input
            type="number"
            name="categoryId"
            value="<%= editMode ? product.getCategoryId() : "" %>"
            required>

        <br><br>


        <label>Supplier ID:</label>

        <input
            type="number"
            name="supplierId"
            value="<%= editMode ? product.getSupplierId() : "" %>"
            required>

        <br><br>


        <label>Unit Price:</label>

        <input
            type="number"
            name="unitPrice"
            step="0.01"
            value="<%= editMode ? product.getUnitPrice() : "" %>"
            required>

        <br><br>


        <label>Cost Price:</label>

        <input
            type="number"
            name="costPrice"
            step="0.01"
            value="<%= editMode ? product.getCostPrice() : "" %>"
            required>

        <br><br>


        <label>Quantity:</label>

        <input
            type="number"
            name="quantity"
            value="<%= editMode ? product.getQuantity() : "" %>"
            required>

        <br><br>


        <label>Reorder Level:</label>

        <input
            type="number"
            name="reorderLevel"
            value="<%= editMode ? product.getReorderLevel() : "" %>"
            required>

        <br><br>


        <label>Description:</label>

        <textarea name="description"><%= editMode ? product.getDescription() : "" %></textarea>

        <br><br>


        <button type="submit">
            <%= editMode ? "Update Product" : "Save Product" %>
        </button>

        <a href="products">Cancel</a>

    </form>

</div>

</body>
</html>