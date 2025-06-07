<!DOCTYPE html>
<html>
<head>
    <title>Вхід</title>
</head>
<body>
<h2>Вхід до системи</h2>
<form method="post" action="/login">
    <label>Ім’я користувача: <input type="text" name="username"/></label><br/>
    <label>Пароль: <input type="password" name="password"/></label><br/>
    <button type="submit">Увійти</button>
</form>

<p>Ще не маєте акаунта? <a href="/register">Зареєструватися</a></p>
</body>
</html>