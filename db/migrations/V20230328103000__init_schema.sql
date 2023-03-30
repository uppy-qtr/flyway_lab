create schema if not exists yury_popov;

use schema flyway_lab.yury_popov;

create table if not exists DEPARTMENTS (
    dep_id number unique, 
    dep_name varchar
);

create table if not exists JOBS(
    job_id number unique, 
    job_name varchar
);

create table if not exists EMPLOYEES (
    emp_id number unique,
    employee_name varchar, 
    job_id number foreign key references JOBS(job_id), 
    dep_id number foreign key references DEPARTMENTS(dep_id)
);