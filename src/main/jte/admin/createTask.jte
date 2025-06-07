@import ua.edu.chnu.kkn.project2_2.Employee
@param java.util.List<Employee> employees


<!DOCTYPE html>
<html>
<head><title>Створити завдання</title></head>
<body>
<h2>Нове завдання</h2>
<form method="post" action="/admin/tasks/create">
    <label>Опис завдання: <input type="text" name="description"/></label><br/>

    <label>Співробітник:
        <select name="employeeId">
            @for(Employee employee : employees)
                <option value="@employee.employeeId">@employee.fullName</option>
            @endfor
        </select>
    </label><br/>

    <button type="submit">Зберегти</button>
</form>
</body>
</html>