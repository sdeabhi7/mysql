-- mysql
-- Write a query to find the second highest salary in an employee table.

select max(salary) from employees where salary < (select max(salary) from employees);

select salary from (select salary from employees order by salary desc limit 2) order by salary limit 1;

-- Fetch all employees whose names contain the letter “a” exactly twice.

-- this query will only apply to 'a'

select employee_name from employees where employee_name like '%a%a%' and employee_name not like '%a%a%a%';

-- this query will take 'A' and 'a'

select employee_name from employees where employee_name like '%a%a%' and employee_name not like '%a%a%a';

-- How do you retrieve only duplicate records from a table?

select (*) from employees having count(*) 1;

-- Write a query to calculate the running total of sales by date.

select sales_date, sales_amount, sum(sum_amount) over (order by sales_date) as running_total from sales;

-- Find employees who earn more than the average salary in their department.

with avg_department as 
(
    select department, avg(salary) as avg_salary from employees group by department
)
select e.name from employees join avg_department d on 
e.department = d.department where e.salary > d.avg_salary;  

-- Write a query to find the most frequently occurring value in a column.

select employee_name from (select employee_name, count(*) as freq from employees 
group by employee_name order by freq desc limit 1) as most_freq;

-- Fetch records where the date is within the last 7 days from today.

select * from employees where today_date >= curdate() - interval 7 day;

-- Write a query to count how many employees share the same salary.

select salary, count(*) from employees group by salary;

-- How do you fetch the top 3 records for each group in a table?

with ranked_products as (
    select 
        product_name,
        category,
        sales,
        row_number() over (partition by category order by sales desc) as rank
    from products
)
select product_name, category, sales
from ranked_products
where rank <= 3;

-- Retrieve products that were never sold (hint: use LEFT JOIN)

select p.product_name from products p left join sales s 
on p.product_name = s.product_name where s.product_name is NULL;
