<!DOCTYPE html>
<html>
<head>
    <title>Новий співробітник</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>
<div class="main">
    <label>Створити співробітника</label>
    <form method="post" action="/admin/employees/create">
        <label class="form-label">Прізвище:</label>
        <input type="text" name="lastName"/>

        <label class="form-label">Ім'я:</label>
        <input type="text" name="firstName"/>

        <label class="form-label">По батькові:</label>
        <input type="text" name="middleName"/>

        <label class="form-label">Оклад:</label>
        <input type="number" name="salary"/>

        <button type="submit">Зберегти</button>
    </form>
</div>
</body>
</html>