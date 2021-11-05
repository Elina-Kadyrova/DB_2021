CREATE SEQUENCE employee_seq;
CREATE TABLE position
(
    position_id SERIAL UNIQUE,
    position_name VARCHAR NOT NULL UNIQUE
);
CREATE TABLE employee
(
    employee_id BIGINT DEFAULT nextval('employee_seq') PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    surname VARCHAR(30) NOT NULL,
    patronymic VARCHAR(30),
    phone_num VARCHAR(12) NOT NULL UNIQUE,
    email VARCHAR(50) NOT NULL UNIQUE,
    position INT NOT NULL,
    FOREIGN KEY (position) REFERENCES position (position_id)
);
create table manager
(
    manager_id BIGINT NOT NULL UNIQUE,
    supervisor_id BIGINT NOT NULL,
    FOREIGN KEY (manager_id) REFERENCES employee (employee_id),
    FOREIGN KEY (supervisor_id) REFERENCES employee (employee_id)
);

INSERT INTO position(position_name)values ('manager');
INSERT INTO position(position_name)values ('superior');

INSERT INTO employee(name, surname, patronymic, phone_num, email, position)
VALUES ('Sasha', 'Ivanov', 'Petrovich', '+87900457399', 'ehihfb@gmail.com', 2);
INSERT INTO employee(name, surname, patronymic, phone_num, email, position)
VALUES ('Pavel', 'Smirnov', 'Stepanovich', '+8936896398', 'eyehfbbf@gmail.com', 1);
INSERT INTO employee(name, surname, patronymic, phone_num, email, position)
VALUES ('Ivan', 'Ivanov', 'Vladimirovich', '+80322896397', 'feiwghfwfjnfnf@gmail.com', 1);
INSERT INTO employee(name, surname, patronymic, phone_num, email, position)
VALUES ('Petr', 'Sidorov', 'Petrovich', '+89900356396', 'wuhjbwf@gmail.com', 1);
INSERT INTO employee(name, surname, patronymic, phone_num, email, position)
VALUES ('Katya', 'Belova', 'Borisovna', '+89900356395', 'ioefjkfkje@yandex.ru', 1);
INSERT INTO employee(name, surname, phone_num, email, position)
VALUES ('Lena', 'Sidorova', '+89900356394', 'eguhjef@mail.com', 1);
INSERT INTO employee(name, surname, patronymic, phone_num, email, position)
VALUES ('Sergey', 'Chernov', 'Ivanovich', '+89903566393', 'eyfhwjefefm@gmail.com', 1);
INSERT INTO employee(name, surname, patronymic, phone_num, email, position)
VALUES ('Olga', 'Petrova', 'Ivanovna', '+88935656392', 'yeeuhdb@mail.ru', 2);
INSERT INTO employee(name, surname, patronymic, phone_num, email, position)
VALUES ('Oleg', 'Nosov', 'Alekseevich', '+89469356391', 'uefjbff@gmail.com', 1);
INSERT INTO employee(name, surname, phone_num, email, position)
VALUES ('Masha', 'Kazakova', '+89904686390', 'nenvvd@gmail.com', 1);

INSERT INTO manager(manager_id, supervisor_id)VALUES (2, 1);
INSERT INTO manager(manager_id, supervisor_id)VALUES (3, 2);
INSERT INTO manager(manager_id, supervisor_id)VALUES (4, 2);
INSERT INTO manager(manager_id, supervisor_id)VALUES (5, 1);
INSERT INTO manager(manager_id, supervisor_id)VALUES (6, 5);
INSERT INTO manager(manager_id, supervisor_id)VALUES (7, 2);
INSERT INTO manager(manager_id, supervisor_id)VALUES (9, 8);
INSERT INTO manager(manager_id, supervisor_id)VALUES (10, 5);

SELECT * from position;
SELECT * from employee;
SELECT * from manager;
