@import ua.edu.chnu.kkn.project2_2.Task
@import ua.edu.chnu.kkn.project2_2.Employee
@import ua.edu.chnu.kkn.project2_2.TaskTypes
@import java.time.format.DateTimeFormatter

@param Task task
@param java.util.List<Employee> employees
@param java.util.List<TaskTypes> taskTypes

<!DOCTYPE html>
<html>
<head><title>Редагувати завдання</title></head>
<body>
<h2>Редагувати завдання</h2>
<form method="post" action="/admin/tasks/edit">
    <input type="hidden" name="taskId" value="${task.getTaskId()}"/>

    <label>Тип завдання:
        <select name="taskTypeId">
            @for(TaskTypes tt : taskTypes)
                @if(tt.getTaskTypeId().equals(task.getTaskType().getTaskTypeId()))
                    <option value="${tt.getTaskTypeId()}" selected>${tt.getDescription()}</option>
                @else
                    <option value="${tt.getTaskTypeId()}">${tt.getDescription()}</option>
                @endif
            @endfor
        </select>
    </label><br/>

    <label>Співробітник:
        <select name="employeeId">
            @for(Employee e : employees)
                @if(e.getEmployeeId().equals(task.getEmployee().getEmployeeId()))
                    <option value="${e.getEmployeeId()}" selected>${e.getFullName()}</option>
                @else
                    <option value="${e.getEmployeeId()}">${e.getFullName()}</option>
                @endif
            @endfor
        </select>
    </label><br/>

    <label>Дата початку:
        @if(task.getStartDate() != null)
            <input type="date" name="startDate" value="${task.getStartDate().format(DateTimeFormatter.ISO_LOCAL_DATE)}"/>
        @else
            <input type="date" name="startDate"/>
        @endif
    </label><br/>

    <label>Дата завершення:
        @if(task.getEndDate() != null)
            <input type="date" name="endDate" value="${task.getEndDate().format(DateTimeFormatter.ISO_LOCAL_DATE)}"/>
        @else
            <input type="date" name="endDate"/>
        @endif
    </label><br/>

    <button type="submit">Зберегти</button>
</form>
</body>
</html>