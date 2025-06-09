@import java.time.format.DateTimeFormatter
@import java.time.LocalDate
@import ua.edu.chnu.kkn.project2_2.Task
@param java.util.List<ua.edu.chnu.kkn.project2_2.Task> tasks
@param String role
@param String sortBy
@param String keyword

!{var formatter = DateTimeFormatter.ofPattern("dd.MM.yyyy");}
<link rel="stylesheet" href="css/styles.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jost:wght@300;400;500;700&display=swap" rel="stylesheet">
<div class="main tasks-main">
    <header class="site-header main">
        <nav class="nav-bar">
            <div>
                <a href="/tasks" class="nav-link">Завдання</a>
                <a href="/employees" class="nav-link">Працівники</a>
                <a href="/tasktypes" class="nav-link">Види робіт</a>
            </div>
        </nav>
    </header>
    <label>Список завдань</label>

    <div class="search-container">
        <form method="get" action="/tasks" class="search-form">
            <input type="text" name="keyword" placeholder="Пошук..." value="${keyword != null ? keyword : ""}" class="search-input">
            <button type="submit" class="search-button">Пошук</button>
        </form>
    </div>

    <div class="sort-container">
        <form method="get" action="/tasks" class="sort-form">
            <select name="sortBy" id="sortBy" class="sort-select">
                <option value="">---</option>

                @if (sortBy != null && sortBy.equals("dateAsc"))
                    <option value="dateAsc" selected>Дата ↑</option>
                @else
                    <option value="dateAsc">Дата ↑</option>
                @endif

                @if (sortBy != null && sortBy.equals("dateDesc"))
                    <option value="dateDesc" selected>Дата ↓</option>
                @else
                    <option value="dateDesc">Дата ↓</option>
                @endif

                @if (sortBy != null && sortBy.equals("nameAsc"))
                    <option value="nameAsc" selected>Прізвище A→Я</option>
                @else
                    <option value="nameAsc">Прізвище A→Я</option>
                @endif

                @if (sortBy != null && sortBy.equals("nameDesc"))
                    <option value="nameDesc" selected>Прізвище Я→A</option>
                @else
                    <option value="nameDesc">Прізвище Я→A</option>
                @endif
            </select>
            <button type="submit" class="sort-button">Сортувати</button>
            <input type="hidden" name="keyword" value="${keyword != null ? keyword : ""}">
        </form>
    </div>

    <ul class="task-list">
        @for (var task : tasks)
            <li class="task-item">
                <div class="task-info">
                    <strong>Працівник:</strong> ${task.getEmployee().getLastName()} ${task.getEmployee().getFirstName()}<br>
                    <strong>Тип роботи:</strong> ${task.getTaskType().getDescription()}<br>
                    <strong>Дата початку:</strong> ${task.getStartDate().format(formatter)}<br>
                    @if (task.getEndDate() != null)
                        <strong>Дата завершення:</strong> ${task.getEndDate().format(formatter)}
                    @else
                        <strong>Дата завершення:</strong> —
                    @endif
                </div>

                @if (role.equals("ROLE_ADMIN"))
                    <div class="button-group">
                        <a href="/admin/tasks/edit/${task.getTaskId()}" class="action-button">Редагувати</a>
                        <button type="button" class="action-button"
                                data-id="${task.getTaskId()}"
                                onclick="confirmDelete(this.dataset.id, 'taskToDeleteId')">Видалити</button>
                    </div>
                @endif
            </li>
        @endfor
    </ul>

    @if (role.equals("ROLE_ADMIN"))
        <div class="create-button-container">
            <a href="/admin/tasks/create" class="button">Створити завдання</a>
        </div>
    @endif
</div>

<div class="modal" id="deleteModal" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content main">
            <form method="post" action="/admin/tasks/delete">
                <div class="modal-header">
                    <label class="modal-title">Підтвердження видалення</label>
                </div>
                <div class="modal-body">
                    <p>Ви впевнені, що хочете видалити це завдання?</p>
                </div>
                <input type="hidden" name="taskId" id="taskToDeleteId" />
                <div class="modal-footer">
                    <button type="button" onclick="hideModal()" class="button">Скасувати</button>
                    <button type="submit" class="button">Видалити</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="js/scripts.js"></script>