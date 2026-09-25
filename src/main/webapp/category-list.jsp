<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Category List</title>

    <link rel="stylesheet" href="Style.css">

</head>

<body>

<div class="container">

<h1>Product Categories</h1>

<p>Manage Categories</p>

<a href="categories?action=new">
    <button type="button">+ Add Category</button>
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
                <th>Name</th>
                <th>Description</th>
				<th>Actions</th>
            </tr>
        </thead>

        <tbody>

        <%
            java.util.List<model.Category> categories =
                (java.util.List<model.Category>)
                request.getAttribute("categories");

            if (categories != null) {

                for (model.Category category : categories) {
        %>

            <tr>

                <td><%= category.getId() %></td>

                <td><%= category.getName() %></td>

				<td><%= category.getDescription() %></td>

				<td>
				<a class="edit-button"
				   href="categories?action=view&id=<%= category.getId() %>">
				    View
				</a>
				<a class="edit-button"
				   href="categories?action=edit&id=<%= category.getId() %>">
				    Edit
				</a>
				<a class="delete-button"
				   href="categories?action=delete&id=<%= category.getId() %>"
				   onclick="return confirm('Delete &quot;<%= category.getName() %>&quot;? This cannot be undone.');">
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
