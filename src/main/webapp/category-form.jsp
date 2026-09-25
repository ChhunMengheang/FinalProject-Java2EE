<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Category Form</title>

    <link rel="stylesheet" href="Style.css">

</head>

<body>

<div class="container">

<%
    model.Category category =
        (model.Category) request.getAttribute("category");
%>

<h1><%= (category == null) ? "Add Category" : "Edit Category" %></h1>

<a href="categories" class="back-link">
    ← Back to Category List
</a>

<br><br>

<form action="categories" method="post">

    <% if (category != null) { %>
        <input type="hidden" name="id" value="<%= category.getId() %>">
    <% } %>

    <label for="name">Name</label>
    <input type="text" id="name" name="name"
           value="<%= (category != null) ? category.getName() : "" %>"
           required>

    <label for="description">Description</label>
    <textarea id="description" name="description"><%=
        (category != null && category.getDescription() != null)
            ? category.getDescription() : ""
    %></textarea>

    <div class="form-actions">
        <button type="submit">Save Category</button>
    </div>

</form>

</div>

</body>
</html>
