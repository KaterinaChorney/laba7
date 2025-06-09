@import ua.edu.chnu.kkn.project2_2.Employee
@param Employee employee
<!DOCTYPE html>
<html>
<head>
    <title>Редагувати співробітника</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>
<div class="main">
    <label>Редагувати співробітника</label>
    <form method="post" action="/admin/employees/edit">
        <input type="hidden" name="employeeId" value="${employee.getEmployeeId()}"/>

        <label class="form-label">Прізвище:</label>
        <input type="text" name="lastName" value="${employee.getLastName()}"/>

        <label class="form-label">Ім'я:</label>
        <input type="text" name="firstName" value="${employee.getFirstName()}"/>

        <label class="form-label">По батькові:</label>
        <input type="text" name="middleName" value="${employee.getMiddleName()}"/>

        <label class="form-label">Оклад:</label>
        <input type="number" name="salary" value="${employee.getSalary()}"/>

        <button type="submit">Зберегти</button>
    </form>
</div>
</body>
</html>