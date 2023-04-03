Create or replace view V_EMPLOYEES
as select
e.employee_name,
j.job_name,
d.dep_name
from EMPLOYEES e 
inner join JOBS j
on e.job_id = j.job_id
inner join DEPARTMENTS d
on e.dep_id = d.dep_id;