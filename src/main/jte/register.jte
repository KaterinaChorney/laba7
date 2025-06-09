<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Реєстрація</title>
    <link rel="stylesheet" href="/css/styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap" rel="stylesheet">
</head>
<body>
<div class="main">
    <div class="signup">
        <form method="post" action="/register">
            <label aria-hidden="true">Реєстрація</label>
            <input type="text" name="username" placeholder="Ім’я користувача" required>
            <input type="password" name="password" placeholder="Пароль" required>
            <input type="text" name="role" placeholder="Роль (USER або ADMIN)" required>
            <div style="text-align: center; margin-top: 20px;">
                <button type="submit" style="
        padding: 14px 28px !important;
        font-size: 16px !important;
        min-width: 220px !important;
        display: inline-block !important;
        box-sizing: border-box !important;
        border: none;
        background-color: #573b8a;
        color: white;
        border-radius: 8px;
        cursor: pointer;">
                    Зареєструватися
                </button>
            </div>
        </form>
        <p style="text-align:center; margin-top: 10px;">
            Вже маєте акаунт?
            <a href="/login" style="color:#573b8a; font-weight: bold;">Увійти</a>
        </p>
    </div>
</div>
</body>
</html>