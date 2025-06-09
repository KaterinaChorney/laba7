@import ua.edu.chnu.kkn.project2_2.TaskTypes
@param TaskTypes taskType
<!DOCTYPE html>
<html>
<head>
    <title>Редагувати тип завдання</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>
<div class="main">
    <label>Редагувати тип завдання</label>
    <form method="post" action="/admin/tasktypes/edit">
        <input type="hidden" name="taskTypeId" value="${taskType.getTaskTypeId()}"/>

        <label class="form-label">Опис:</label>
        <input type="text" name="description" value="${taskType.getDescription()}" required/>

        <label class="form-label">Оплата за день:</label>
        <input type="number" name="dailyPayment" value="${taskType.getDailyPayment()}" required/>

        <button type="submit">Зберегти</button>
    </form>
</div>
</body>
</html>