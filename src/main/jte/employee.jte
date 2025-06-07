@import ua.edu.chnu.kkn.project2_2.Employee
@param java.util.List<Employee> employees
<h1>Список співробітників</h1>

<table border="1">
    <thead>
    <tr>
        <th>Прізвище</th>
        <th>Ім’я</th>
        <th>По батькові</th>
        <th>Оклад</th>
    </tr>
    </thead>
    <tbody>
    @for (Employee employee : employees)
        <tr>
            <td>${employee.getLastName()}</td>
            <td>${employee.getFirstName()}</td>
            <td>${employee.getMiddleName()}</td>
            <td>${employee.getSalary()}</td>
        </tr>
    @endfor
    </tbody>
</table>