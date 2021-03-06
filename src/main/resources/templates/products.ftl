<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<a href="/getCartBySessionId">Go to Cart</a>
<br>
<div>
    <h3>Количество товара в корзине: <#if cart_size??>${cart_size}</#if></h3>
</div>
<br>
<hr>
<div>
    <#list products?if_exists as product>
        <h3>Product name: <#if product.getName()??>${product.getName()}</#if> </h3>
        <h3>Product category name: <#if product.getCategory()??> ${product.getCategory().getType_of_product()} </#if></h3>
        <h3>Product price: <#if product.getPrice()??> ${product.getPrice()} </#if> so'm</h3>
        <h3>Product discount price: <#if product.getAfter_discount()??>${product.getAfter_discount()}</#if></h3>
        <a href="/viewProductById/${product.getId()}">
            <img src="<#if product.getPhoto()??>${product.getPhoto()}</#if>" alt="product_image">
        </a>
        <form action="/addToCart" method="post">
            <input type="hidden" name="id" value="${product.getId()}">
            <input type="submit" value="добавить в корзину">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
        </form>
        <br>
        <br>
        <hr>
    </#list>

</div>
</body>
</html>