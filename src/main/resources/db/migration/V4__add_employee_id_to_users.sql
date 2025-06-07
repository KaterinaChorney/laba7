ALTER TABLE users
    ADD COLUMN employee_id BIGINT;

ALTER TABLE users
    ADD CONSTRAINT fk_users_employee
        FOREIGN KEY (employee_id) REFERENCES employee(employee_id);
