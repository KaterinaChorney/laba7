@import java.time.format.DateTimeFormatter
@import java.time.LocalDate
@import ua.edu.chnu.kkn.project2_2.Task

@param java.util.List<ua.edu.chnu.kkn.project2_2.Task> tasks
@param String role
@param String sortBy

!{var formatter = DateTimeFormatter.ofPattern("dd.MM.yyyy");}

<h1>Список завдань</h1>
<form method="get" action="/tasks" class="mb-3">
    <label for="sortBy">Сортувати за:</label>
    <select name="sortBy" id="sortBy" onchange="this.form.submit()">
        <option value="">---</option>
        @if (sortBy != null)
            @if (sortBy.equals("dateAsc"))
                <option value="dateAsc" selected>Дата ↑</option>
            @else
                <option value="dateAsc">Дата ↑</option>
            @endif

            @if (sortBy.equals("dateDesc"))
                <option value="dateDesc" selected>Дата ↓</option>
            @else
                <option value="dateDesc">Дата ↓</option>
            @endif

            @if (sortBy.equals("nameAsc"))
                <option value="nameAsc" selected>Прізвище A→Я</option>
            @else
                <option value="nameAsc">Прізвище A→Я</option>
            @endif

            @if (sortBy.equals("nameDesc"))
                <option value="nameDesc" selected>Прізвище Я→A</option>
            @else
                <option value="nameDesc">Прізвище Я→A</option>
            @endif
        @else
            <option value="dateAsc">Дата ↑</option>
            <option value="dateDesc">Дата ↓</option>
            <option value="nameAsc">Прізвище A→Я</option>
            <option value="nameDesc">Прізвище Я→A</option>
        @endif
    </select>
</form>

@if (role.equals("ROLE_ADMIN"))
    <a href="/admin/tasks/create" class="btn btn-primary mb-3">Створити завдання</a>
@endif

<!-- Модальне вікно -->
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
        <li class="mb-3">
            <strong>Працівник:</strong> ${task.getEmployee().getLastName()} ${task.getEmployee().getFirstName()}<br>
            <strong>Тип роботи:</strong> ${task.getTaskType().getDescription()}<br>
            <strong>Дата початку:</strong> ${task.getStartDate().format(formatter)}<br>
            @if (task.getEndDate() != null)
                <strong>Дата завершення:</strong> ${task.getEndDate().format(formatter)}
            @else
                <strong>Дата завершення:</strong> —
            @endif

            @if (role.equals("ROLE_ADMIN"))
                <br>
                <a href="/admin/tasks/edit/${task.getTaskId()}" class="btn btn-sm btn-outline-primary mt-2">Редагувати</a>

                <button type="button"
                        class="btn btn-danger btn-sm mt-2"
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