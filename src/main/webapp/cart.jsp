<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Shopping Cart</title>
</head>
<body>
    <h1>Your Shopping Cart</h1>

    <c:if test="${empty cart.products}">
        <p>Your cart is empty</p>
    </c:if>

    <c:if test="${not empty cart.products}">
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Price</th>
                <th>Action</th>
            </tr>
            <c:forEach items="${cart.products}" var="product">
                <tr>
                    <td>${product.value.id}</td>
                    <td>${product.value.name}</td>
                    <td>${product.value.price}</td>
                    <td>
                        <button onclick="removeProduct('${product.value.id}')">Remove</button>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:if>

    <h2>Add Product</h2>
    <form action="cart" method="post">
        ID: <input type="text" name="productId"><br>
        Name: <input type="text" name="productName"><br>
        Price: <input type="text" name="price"><br>
        <input type="submit" value="Add to Cart">
    </form>

    <script>
        function removeProduct(productId) {
            fetch('cart', {
                method: 'DELETE',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: 'productId=' + productId
            }).then(response => {
                if (response.ok) {
                    location.reload();
                }
            });
        }
    </script>
</body>
</html>