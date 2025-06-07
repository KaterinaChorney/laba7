@import ua.edu.chnu.kkn.project2_2.TaskTypes
@param java.util.List<TaskTypes> taskTypes
<h1>Список типів завдань</h1>

<table border="1">
    <thead>
    <tr>
        <th>Назва</th>
        <th>Опис</th>
    </tr>
    </thead>
    <tbody>
    @for (TaskTypes type : taskTypes)
        <tr>
            <td>${type.getDescription()}</td>
            <td>${type.getDailyPayment()}</td>
        </tr>
    @endfor
    </tbody>
</table>
