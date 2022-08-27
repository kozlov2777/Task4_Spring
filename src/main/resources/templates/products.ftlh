<!DOCTYPE html>
<html>
<head>
    <title>SELL</title>
</head>
<body>
<h1><a href="/">SELL</a>
<#if user.email??>
    <h3>Имя пользователя: <i>${user.name}</i></h3>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Выйти"/>
    </form>
    <#if user.isAdmin()>
        <a href="/admin">Панель администратора</a>
        </#if>
<#else>
    <a href="/login">Войти</a></h1>
</#if>
<a href="/registration">Зарегестрироваться</a>
</h1><hr>
<h4>Товары со всей Украины</h4>
<hr>
<form action="/" method="get">
    Поиск по названию объявления: <input type="text" name="title">
    <input type="submit" value="Поиск"/>

</form>
<hr>
<form action="/product/findByBrand" method="get">
    Поиск по названию марки: <input type="text" name="brand">
    <input type="submit" value="Поиск"/>
</form>
<hr>
<form action="/product/findByModel" method="get">
    Поиск по названию модели: <input type="text" name="modelCar">
    <input type="submit" value="Поиск"/>
</form>
<hr>
<form action="/product/findByBrandAndModelCar" method="get">
    Поиск по названию марки и модели: <input type="text" name="brand"> <input type="text" name="modelCar">
    <input type="submit" value="Поиск"/>
</form>
<hr>
<#list products as product>
    <div>
        <p><b>${product.title}</b> ${product.price} руб. ${product.brand} ${product.modelCar} | <a href="/product/${product.id}">Подробнее...</a></p>
    </div>
<#else>
    <h3>Товаров нет</h3>
</#list>
<#if user.email??>
    <hr>
    <h3>Создать новый товар</h3>
    <form action="/product/create" method="post" enctype="multipart/form-data">
        Название объявления: <input type="text" name="title"/><br><br>
        Марка машины: <input type="text" name="brand"/><br><br>
        Модель машины: <input type="text" name="modelCar"/><br><br>
        Описание объявления: <input type="text" name="description"/><br><br>
        Цена: <input type="number" name="price"/><br><br>
        Город: <input type="text" name="city"/><br><br>
        Первая фотография: <input type="file" name="file1"/><br><br>
        Вторая фотография: <input type="file" name="file2"/><br><br>
        Третья фотография: <input type="file" name="file3"/><br><br>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Добавить товар"/>
    </form>
</#if>
</body>
</html>