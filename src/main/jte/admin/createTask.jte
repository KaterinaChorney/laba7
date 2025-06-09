@import ua.edu.chnu.kkn.project2_2.Employee
@import ua.edu.chnu.kkn.project2_2.TaskTypes

@param java.util.List<Employee> employees
@param java.util.List<TaskTypes> taskTypes

<!DOCTYPE html>
<html>
<head>
    <title>Створити завдання</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>
<div class="main">
    <label>Створити завдання</label>
    <form method="post" action="/admin/tasks/create">
        <label class="form-label">Тип завдання:</label>
        <select name="taskTypeId">
            @for(TaskTypes tt : taskTypes)
                <option value="${tt.getTaskTypeId()}">${tt.getDescription()}</option>
            @endfor
        </select>

        <label class="form-label">Співробітник:</label>
        <select name="employeeId">
            @for(Employee e : employees)
                <option value="${e.getEmployeeId()}">${e.getFullName()}</option>
            @endfor
        </select>

        <label class="form-label">Дата початку:</label>
        <input type="date" name="startDate"/>

        <button type="submit">Зберегти</button>
    </form>
</div>
</body>
</html>