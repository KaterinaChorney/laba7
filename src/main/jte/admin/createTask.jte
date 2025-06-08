@import ua.edu.chnu.kkn.project2_2.Employee
@import ua.edu.chnu.kkn.project2_2.TaskTypes

@param java.util.List<Employee> employees
@param java.util.List<TaskTypes> taskTypes


<!DOCTYPE html>
<html>
<head><title>Створити завдання</title></head>
<body>
<h2>Нове завдання</h2>

<form method="post" action="/admin/tasks/create">
    <label>Тип завдання:
        <select name="taskTypeId">
            @for(TaskTypes tt : taskTypes)
                <option value="${tt.getTaskTypeId()}">${tt.getDescription()}</option>
            @endfor
        </select>
    </label><br/>

    <label>Співробітник:
        <select name="employeeId">
            @for(Employee e : employees)
                <option value="${e.getEmployeeId()}">${e.getFullName()}</option>
            @endfor
        </select>
    </label><br/>

    <label>Дата початку:
        <input type="date" name="startDate"/>
    </label><br/>

    <button type="submit">Зберегти</button>
</form>
</body>
</html>
