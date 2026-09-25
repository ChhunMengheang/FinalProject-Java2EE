<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Category Details</title>

    <link rel="stylesheet" href="Style.css">

</head>

<body>

<div class="container">

<h1>Category Details</h1>

<a href="categories" class="back-link">
    ← Back to Category List
</a>

<br><br>

<%
    model.Category category =
        (model.Category) request.getAttribute("category");

    if (category != null) {
%>

<div class="table-container">
<table class="product-table">
    <tbody>
        <tr>
            <td><strong>ID</strong></td>
            <td><%= category.getId() %></td>
        </tr>
        <tr>
            <td><strong>Name</strong></td>
            <td><%= category.getName() %></td>
        </tr>
        <tr>
            <td><strong>Description</strong></td>
            <td><%= category.getDescription() %></td>
        </tr>
    </tbody>
</table>
</div>

<br>

<a class="edit-button"
   href="categories?action=edit&id=<%= category.getId() %>">
    Edit
</a>
<a class="delete-button"
   href="categories?action=delete&id=<%= category.getId() %>"
   onclick="return confirm('Delete &quot;<%= category.getName() %>&quot;? This cannot be undone.');">
    Delete
</a>

<%
    } else {
%>

<p>Category not found.</p>

<%
    }
%>

</div>

</body>
</html>
