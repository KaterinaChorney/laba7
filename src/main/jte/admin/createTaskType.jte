<!DOCTYPE html>
<html>
<head>
    <title>Новий тип завдання</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>
<div class="main">
    <label>Створити тип завдання</label>
    <form method="post" action="/admin/tasktypes/create">
        <label class="form-label">Опис:</label>
        <input type="text" name="description" required/>

        <label class="form-label">Оплата за день:</label>
        <input type="number" name="dailyPayment" required/>

        <button type="submit">Зберегти</button>
    </form>
</div>
</body>
</html>