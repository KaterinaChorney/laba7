@import ua.edu.chnu.kkn.project2_2.TaskTypes
@param java.util.List<ua.edu.chnu.kkn.project2_2.TaskTypes> taskTypes
@param String role
@param String sortBy
@param String keyword

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
                <a href="/tasktypes" class="nav-link active">Види робіт</a>
            </div>
        </nav>
    </header>
    <label>Список видів робіт</label>

    <div class="search-container">
        <form method="get" action="/tasktypes" class="search-form">
            <input type="text" name="keyword" placeholder="Пошук..." value="${keyword != null ? keyword : ""}" class="search-input">
            <button type="submit" class="search-button">Пошук</button>
        </form>
    </div>

    <div class="sort-container">
        <form method="get" action="/tasktypes" class="sort-form">
            <select name="sortBy" id="sortBy" class="sort-select">
                <option value="">---</option>
                @if (sortBy != null && sortBy.equals("nameAsc"))
                    <option value="nameAsc" selected>Назва ↑</option>
                @else
                    <option value="nameAsc">Назва ↑</option>
                @endif
                @if (sortBy != null && sortBy.equals("nameDesc"))
                    <option value="nameDesc" selected>Назва ↓</option>
                @else
                    <option value="nameDesc">Назва ↓</option>
                @endif
            </select>
            <button type="submit" class="sort-button">Сортувати</button>
            <input type="hidden" name="keyword" value="${keyword != null ? keyword : ""}">
        </form>
    </div>

    <ul class="task-list">
        @for (var taskType : taskTypes)
            <li class="task-item">
                <div class="task-info">
                    <strong>Назва:</strong> ${taskType.getDescription()}<br>
                    <strong>Оплата за день:</strong> ${taskType.getDailyPayment()}
                </div>

                @if (role.equals("ROLE_ADMIN"))
                    <div class="button-group">
                        <a href="/admin/tasktypes/edit/${taskType.getTaskTypeId()}" class="action-button">Редагувати</a>
                        <button type="button" class="action-button"
                                data-id="${taskType.getTaskTypeId()}"
                                onclick="confirmDelete(this.dataset.id, 'taskTypeToDeleteId')">Видалити</button>
                    </div>
                @endif
            </li>
        @endfor
    </ul>

    @if (role.equals("ROLE_ADMIN"))
        <div class="create-button-container">
            <a href="/admin/tasktypes/create" class="button">Додати вид роботи</a>
        </div>
    @endif
</div>

<div class="modal" id="deleteModal" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content main">
            <form method="post" action="/admin/tasktypes/delete">
                <div class="modal-header">
                    <label class="modal-title">Підтвердження видалення</label>
                </div>
                <div class="modal-body">
                    <p>Ви впевнені, що хочете видалити цей вид роботи?</p>
                </div>
                <input type="hidden" name="taskTypeId" id="taskTypeToDeleteId" />
                <div class="modal-footer">
                    <button type="button" onclick="hideModal()" class="button">Скасувати</button>
                    <button type="submit" class="button">Видалити</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="js/scripts.js"></script>