@import ua.edu.chnu.kkn.project2_2.Task
@import ua.edu.chnu.kkn.project2_2.Employee
@import ua.edu.chnu.kkn.project2_2.TaskTypes
@import java.time.format.DateTimeFormatter
@param Task task
@param java.util.List<Employee> employees
@param java.util.List<TaskTypes> taskTypes
<!DOCTYPE html>
<html>
<head>
    <title>Редагувати завдання</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>
<div class="main">
    <label>Редагувати завдання</label>
    <form method="post" action="/admin/tasks/edit">
        <input type="hidden" name="taskId" value="${task.getTaskId()}"/>

        <label class="form-label">Тип завдання:</label>
        <select name="taskTypeId">
            @for(TaskTypes tt : taskTypes)
                @if(tt.getTaskTypeId().equals(task.getTaskType().getTaskTypeId()))
                    <option value="${tt.getTaskTypeId()}" selected>${tt.getDescription()}</option>
                @else
                    <option value="${tt.getTaskTypeId()}">${tt.getDescription()}</option>
                @endif
            @endfor
        </select>

        <label class="form-label">Співробітник:</label>
        <select name="employeeId">
            @for(Employee e : employees)
                @if(e.getEmployeeId().equals(task.getEmployee().getEmployeeId()))
                    <option value="${e.getEmployeeId()}" selected>${e.getFullName()}</option>
                @else
                    <option value="${e.getEmployeeId()}">${e.getFullName()}</option>
                @endif
            @endfor
        </select>

        <label class="form-label">Дата початку:</label>
        @if(task.getStartDate() != null)
            <input type="date" name="startDate" value="${task.getStartDate().format(DateTimeFormatter.ISO_LOCAL_DATE)}"/>
        @else
            <input type="date" name="startDate"/>
        @endif

        <label class="form-label">Дата завершення:</label>
        @if(task.getEndDate() != null)
            <input type="date" name="endDate" value="${task.getEndDate().format(DateTimeFormatter.ISO_LOCAL_DATE)}"/>
        @else
            <input type="date" name="endDate"/>
        @endif

        <button type="submit">Зберегти</button>
    </form>
</div>
</body>
</html>