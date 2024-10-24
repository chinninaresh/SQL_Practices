
-- write a command to retrieve the first 5 employees by highest salary
Select * from employees order by salary desc limit 5;

select * from departments ;

select * from departments where department_name like 'H%';

-- Retrieve the 5 employees with lowest salary skipping the first 10 record
Select * from employees order by salary desc limit 5 offset 10;

-- display each departments total salary, but only show department where the total salary exceeded $30,000
Select d.department_id, sum(salary) as total_salary
from employees e
join departments d on d.department_id = e.department_id
group by d.department_id
having total_salary > 10000;

-- for each employee, display their salary and a note if above or below $7000
Select employee_id, salary, 
case
	when salary > 7000 then 'above $7000'
    else 'below $700'
    end as salary_note
from employees;

-- List the projects that started in last 5 months
Select * from projects where start_date >= date_sub(curdate(), interval 5 month);

-- display all projects including with no employees assigned 
Select p.project_id, p.project_name, e.employee_id, e.first_name
from employees e join employeeprojects ep on e.employee_id = ep.employee_id right join projects p on ep.project_id = p.project_id;

-- Update Query with a condition
Update employees e join departments d on e.department_id = d.department_id 
set e.salary = e.salary*1.12 where d.department_name='Finance';

-- String Funtions
Select first_name, last_name from employees where last_name like 'J%';

-- Aggrigate with count
Select department_id, count(*) as employee_count from employees group by department_id;
Select d.department_name, count(e.employee_id) as employee_count from employees e 
join departments d on e.department_id=d.department_id group by d.department_name;

-- join and aggrigation
Select p.project_name, sum(ep.hours_worked) as total_hours from employeeprojects ep
join projects p on ep.project_id=p.project_id group by p.project_name;


