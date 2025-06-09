@import java.time.format.DateTimeFormatter
@import java.time.LocalDate
@import ua.edu.chnu.kkn.project2_2.Employee
@import ua.edu.chnu.kkn.project2_2.TaskTypes
@param java.util.List<ua.edu.chnu.kkn.project2_2.Employee> employees
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
                <a href="/employees" class="nav-link active">Працівники</a>
                <a href="/tasktypes" class="nav-link">Види робіт</a>
            </div>
        </nav>
    </header>
    <label>Список працівників</label>

    <div class="search-container">
        <form method="get" action="/employees" class="search-form">
            <input type="text" name="keyword" placeholder="Пошук..." value="${keyword != null ? keyword : ""}" class="search-input">
            <button type="submit" class="search-button">Пошук</button>
        </form>
    </div>

    <div class="sort-container">
        <form method="get" action="/employees" class="sort-form">
            <select name="sortBy" id="sortBy" class="sort-select">
                <option value="">---</option>
                @if (sortBy != null && sortBy.equals("lastNameAsc"))
                    <option value="lastNameAsc" selected>Прізвище ↑</option>
                @else
                    <option value="lastNameAsc">Прізвище ↑</option>
                @endif
                @if (sortBy != null && sortBy.equals("lastNameDesc"))
                    <option value="lastNameDesc" selected>Прізвище ↓</option>
                @else
                    <option value="lastNameDesc">Прізвище ↓</option>
                @endif
                @if (sortBy != null && sortBy.equals("salaryAsc"))
                    <option value="salaryAsc" selected>Оклад ↑</option>
                @else
                    <option value="salaryAsc">Оклад ↑</option>
                @endif
                @if (sortBy != null && sortBy.equals("salaryDesc"))
                    <option value="salaryDesc" selected>Оклад ↓</option>
                @else
                    <option value="salaryDesc">Оклад ↓</option>
                @endif
            </select>
            <button type="submit" class="sort-button">Сортувати</button>
            <input type="hidden" name="keyword" value="${keyword != null ? keyword : ""}">
        </form>
    </div>

    <ul class="employee-list">
        @for (var employee : employees)
            <li class="employee-item">
                <div class="employee-info">
                    <strong>ПІБ:</strong> ${employee.getLastName()} ${employee.getFirstName()} ${employee.getMiddleName() != null ? employee.getMiddleName() : ""} <br>
                    <strong>Оклад:</strong> ${employee.getSalary()} грн
                </div>

                @if (role.equals("ROLE_ADMIN"))
                    <div class="button-group">
                        <a href="/admin/employees/edit/${employee.getEmployeeId()}" class="action-button">Редагувати</a>
                        <button type="button" class="action-button"
                                data-id="${employee.getEmployeeId()}"
                                onclick="confirmDelete(this.dataset.id, 'employeeToDeleteId')">Видалити</button>
                    </div>
                @endif
            </li>
        @endfor
    </ul>

    @if (role.equals("ROLE_ADMIN"))
        <div class="create-button-container">
            <a href="/admin/employees/create" class="button">Додати співробітника</a>
        </div>
    @endif
</div>

<div class="modal" id="deleteModal" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content main">
            <form method="post" action="/admin/employees/delete">
                <div class="modal-header">
                    <label class="modal-title">Підтвердження видалення</label>
                </div>
                <div class="modal-body">
                    <p>Ви впевнені, що хочете видалити цього співробітника?</p>
                </div>
                <input type="hidden" name="employeeId" id="employeeToDeleteId" />
                <div class="modal-footer">
                    <button type="button" onclick="hideModal()" class="button">Скасувати</button>
                    <button type="submit" class="button">Видалити</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="js/scripts.js"></script>