CREATE TABLE employee (
                          employee_id SERIAL PRIMARY KEY,
                          last_name VARCHAR(255),
                          first_name VARCHAR(255),
                          middle_name VARCHAR(255),
                          salary INTEGER
);

CREATE TABLE task_type (
                           task_type_id SERIAL PRIMARY KEY,
                           description VARCHAR(255),
                           daily_payment INTEGER
);

CREATE TABLE task (
                      task_id SERIAL PRIMARY KEY,
                      employee_id INTEGER REFERENCES employee(employee_id),
                      task_type_id INTEGER REFERENCES task_type(task_type_id),
                      start_date DATE,
                      end_date DATE
);
