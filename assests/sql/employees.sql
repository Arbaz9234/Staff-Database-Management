
show databases;
DROP DATABASE IF EXISTS employees;
CREATE DATABASE employees;
USE employees;
CREATE TABLE department (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(30) UNIQUE NOT NULL
);
drop table department;
desc department;
CREATE TABLE role (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(30) UNIQUE NOT NULL,
  salary DECIMAL  NOT NULL,
  department_id INT  NOT NULL,
  INDEX dep_ind (department_id),
  CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES department(id) ON DELETE CASCADE
);
drop table role;
CREATE TABLE employee (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  role_id INT  NOT NULL,
  INDEX role_ind (role_id),
  CONSTRAINT fk_role FOREIGN KEY (role_id) REFERENCES role(id) ON DELETE CASCADE,
  manager_id INT ,
  INDEX man_ind (manager_id),
  CONSTRAINT fk_manager FOREIGN KEY (manager_id) REFERENCES employee(id) ON DELETE SET NULL
);
drop table employee;
use employees;
INSERT INTO department
    (id,name)
VALUES
    
	  (1,'Admin'),
    (2,'Teaching'),
    (3,'Non Teaching');
--     ('Executive');
INSERT INTO role
    (id, title, salary, department_id)
VALUES
    (1,'Science', 50000, 2),
    (2,'Maths', 50000, 2),
    (3,'English', 50000, 2),
    (4,'Hindi', 50000, 2),
    (5,'SST', 50000, 2),
    (6,'Science Lab', 40000, 3),
    (7,'Maths Lab', 40000, 3),
    (8,'English Lab', 40000, 3),
    (9,'Hindi Lab', 40000, 3),
    (10,'SST Lab', 40000, 3);
select * from role;
INSERT INTO employee
    (id,first_name, last_name, role_id, manager_id)
VALUES
    (1,'Ishaan', 'Kishan', 2, 1);

    -- (2,'Arnav', 'Bhatia', 2, NULL),
    -- (3,'Mahesh', 'Bhat', 3, NULL),
    -- (4,'Anamika', 'Singh', 2, NULL),
    -- (5,'Shailendra', 'Pratap',2, NULL),
    -- (6,'Aadhya', 'Gupta', 3, NULL),
    -- (7,'Harsh', 'Bansal', 3, NULL),
    -- (8,'Kishore', 'Awasthi', 2, NULL);
