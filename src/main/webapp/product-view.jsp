<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Product Details</title>

    <link rel="stylesheet" href="Style.css">

</head>

<body>

<div class="container">

<h1>Product Details</h1>

<a href="products" class="back-link">
    ← Back to Product List
</a>

<br><br>

<%
    model.Product product =
        (model.Product) request.getAttribute("product");

    if (product != null) {
%>

<div class="table-container">
<table class="product-table">
    <tbody>
        <tr>
            <td><strong>ID</strong></td>
            <td><%= product.getId() %></td>
        </tr>
        <tr>
            <td><strong>Product Name</strong></td>
            <td><%= product.getName() %></td>
        </tr>
        <tr>
            <td><strong>SKU</strong></td>
            <td><%= product.getSku() %></td>
        </tr>
        <tr>
            <td><strong>Category ID</strong></td>
            <td><%= product.getCategoryId() %></td>
        </tr>
        <tr>
            <td><strong>Supplier ID</strong></td>
            <td><%= product.getSupplierId() %></td>
        </tr>
        <tr>
            <td><strong>Unit Price</strong></td>
            <td>$<%= product.getUnitPrice() %></td>
        </tr>
        <tr>
            <td><strong>Cost Price</strong></td>
            <td>$<%= product.getCostPrice() %></td>
        </tr>
        <tr>
            <td><strong>Quantity</strong></td>
            <td><%= product.getQuantity() %></td>
        </tr>
        <tr>
            <td><strong>Reorder Level</strong></td>
            <td><%= product.getReorderLevel() %></td>
        </tr>
        <tr>
            <td><strong>Description</strong></td>
            <td><%= product.getDescription() %></td>
        </tr>
    </tbody>
</table>
</div>

<br>

<a class="edit-button"
   href="products?action=edit&id=<%= product.getId() %>">
    Edit
</a>
<a class="delete-button"
   href="products?action=delete&id=<%= product.getId() %>"
   onclick="return confirm('Delete &quot;<%= product.getName() %>&quot;? This cannot be undone.');">
    Delete
</a>

<%
    } else {
%>

<p>Product not found.</p>

<%
    }
%>

</div>

</body>
</html>
