-- Задание 1

CREATE DATABASE skypro;


CREATE TABLE employee
(
    id         BIGSERIAL   NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name  VARCHAR(50) NOT NULL,
    gender     VARCHAR(6)  NOT NULL,
    age        INT         NOT NULL
);

INSERT INTO employee (first_name, last_name, gender, age)
VALUES ('Ivan', 'Ivanov', 'Male', 30);

INSERT INTO employee (first_name, last_name, gender, age)
VALUES ('Polina', 'Ignatova', 'Female', 25);

INSERT INTO employee (first_name, last_name, gender, age)
VALUES ('Maksim', 'Lebedev', 'Male', 23);

SELECT * FROM employee;

UPDATE employee
SET first_name = 'Oleg',
    last_name  = 'Gazmanov',
    gender     = 'Male',
    age        = '18'
WHERE last_name = 'Lebedev';

SELECT *
FROM employee;

DELETE
FROM employee
WHERE last_name = 'Ivanov';

SELECT *
FROM employee;