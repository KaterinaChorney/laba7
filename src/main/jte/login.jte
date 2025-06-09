<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Вхід</title>
    <link rel="stylesheet" href="/css/styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap" rel="stylesheet">
</head>
<body>
<div class="main">
    <div class="login">
        <form method="post" action="/login">
            <label aria-hidden="true">Вхід</label>
            <input type="text" name="username" placeholder="Ім’я користувача" required>
            <input type="password" name="password" placeholder="Пароль" required>
            <button type="submit">Увійти</button>
        </form>
        <p style="text-align:center; margin-top: 10px;">
            Ще не маєте акаунта?
            <a href="/register" style="color:#573b8a; font-weight: bold;">Зареєструватися</a>
        </p>
    </div>
</div>
</body>
</html>