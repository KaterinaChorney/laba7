@import java.time.format.DateTimeFormatter
@import java.time.LocalDate
@import ua.edu.chnu.kkn.project2_2.Task

@param java.util.List<ua.edu.chnu.kkn.project2_2.Task> tasks

!{var formatter = DateTimeFormatter.ofPattern("dd.MM.yyyy");}

<h1>Список завдань</h1>

<ul>
    @for (var task : tasks)
        <li>
            Працівник: ${task.getEmployee().getLastName()} ${task.getEmployee().getFirstName()}<br>
            Тип роботи: ${task.getTaskType().getDescription()}<br>
            Дата початку: ${task.getStartDate().format(formatter)}<br>
            @if (task.getEndDate() != null)
                Дата завершення: ${task.getEndDate().format(formatter)}
            @else
                Дата завершення: —
            @endif
        </li>
    @endfor
</ul>