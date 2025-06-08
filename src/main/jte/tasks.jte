@import java.time.format.DateTimeFormatter
@import java.time.LocalDate
@import ua.edu.chnu.kkn.project2_2.Task

@param java.util.List<ua.edu.chnu.kkn.project2_2.Task> tasks
@param String role

!{var formatter = DateTimeFormatter.ofPattern("dd.MM.yyyy");}

<h1>Список завдань</h1>

@if (role.equals("ROLE_ADMIN"))
    <br>
    <a href="/admin/tasks/create">Створити завдання</a>
@endif

<!-- Bootstrap модальне вікно -->
<div class="modal" id="deleteModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <form method="post" action="/admin/tasks/delete">
                <div class="modal-header">
                    <h5 class="modal-title">Підтвердження видалення</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Закрити"></button>
                </div>
                <div class="modal-body">
                    <p>Ви впевнені, що хочете видалити це завдання?</p>
                </div>
                <input type="hidden" name="taskId" id="taskToDeleteId" />
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Скасувати</button>
                    <button type="submit" class="btn btn-danger">Видалити</button>
                </div>
            </form>
        </div>
    </div>
</div>

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

            @if (role.equals("ROLE_ADMIN"))
                <br>
                <a href="/admin/tasks/edit/${task.getTaskId()}">Редагувати</a>

                <!-- Кнопка, що відкриває модальне вікно -->
                <button type="button"
                        class="btn btn-danger btn-sm"
                        onclick="confirmDelete(${task.getTaskId()})"
                        data-bs-toggle="modal"
                        data-bs-target="#deleteModal">
                    Видалити
                </button>
            @endif
        </li>
    @endfor
</ul>

<script>
    function confirmDelete(taskId) {
        document.getElementById('taskToDeleteId').value = taskId;
    }
</script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>