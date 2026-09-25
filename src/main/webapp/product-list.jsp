<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Product List</title>

    <link rel="stylesheet" href="Style.css">

</head>

<body>

<div class="container">

<h1>Computer Accessories</h1>

<p>Product Stock List</p>

<a href="products?action=new">
    <button type="button">+ Add Product</button>
</a>

<br><br>

<a href="index.jsp" class="back-link">
    ← Back to Home
</a>

    <br><br>

<div class="table-container">

<table class="product-table">

        <thead>
            <tr>
                <th>ID</th>
                <th>Product Name</th>
                <th>SKU</th>
                <th>Category ID</th>
                <th>Supplier ID</th>
                <th>Unit Price</th>
                <th>Cost Price</th>
                <th>Quantity</th>
                <th>Reorder Level</th>
                <th>Description</th>
				<th>Actions</th>
            </tr>
        </thead>

        <tbody>

        <%
            java.util.List<model.Product> products =
                (java.util.List<model.Product>)
                request.getAttribute("products");

            if (products != null) {

                for (model.Product product : products) {

                    boolean isLowStock =
                        product.getQuantity() <= product.getReorderLevel();
        %>

            <tr<%= isLowStock ? " class=\"low-stock\"" : "" %>>

                <td><%= product.getId() %></td>

                <td><%= product.getName() %></td>

                <td><%= product.getSku() %></td>

                <td><%= product.getCategoryId() %></td>

                <td><%= product.getSupplierId() %></td>

                <td>$<%= product.getUnitPrice() %></td>

                <td>$<%= product.getCostPrice() %></td>

                <td><%= product.getQuantity() %></td>

                <td><%= product.getReorderLevel() %></td>

				<td><%= product.getDescription() %></td>

				<td>
				<a class="edit-button"
				   href="products?action=view&id=<%= product.getId() %>">
				    View
				</a>
				<a class="edit-button"
				   href="products?action=edit&id=<%= product.getId() %>">
				    Edit
				</a>
				<a class="delete-button"
				   href="products?action=delete&id=<%= product.getId() %>"
				   onclick="return confirm('Delete &quot;<%= product.getName() %>&quot;? This cannot be undone.');">
				    Delete
				</a>
				</td>

            </tr>

        <%
                }

            }
        %>

        </tbody>

    </table>
    </div>

</div>

</body>
</html>
