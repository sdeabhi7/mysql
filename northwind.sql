-- mysql
-- Show the category_name and description from the categories table sorted by category_name.

select category_name, description from categories order by category_name;

-- Show all the contact_name, address, city of all customers which are not from 'Germany', 'Mexico', 'Spain'

select contact_name, address, city from customers where country not in ('Germany', 'Mexico', 'Spain');

-- Show order_date, shipped_date, customer_id, Freight of all orders placed on 2018 Feb 26

select order_date, shipped_date, customer_id, freight from orders where order_date = '2018-02-26';

-- Show the employee_id, order_id, customer_id, required_date, shipped_date from all orders shipped later than the required date

select employee_id, order_id, customer_id, required_date, shipped_date from orders where shipped_date > required_date;

-- Show all the even numbered Order_id from the orders table

select order_id from orders where order_id % 2 = 0;

-- Show the city, company_name, contact_name of all customers from cities which contains the letter 'L' in the city name, sorted by contact_name

select city, company_name, contact_name from customers where city like '%l%' order by contact_name;

-- Show the company_name, contact_name, fax number of all customers that has a fax number. (not null)

select company_name, contact_name, fax from customers where fax is not null;

-- Show the first_name, last_name. hire_date of the most recently hired employee.

select first_name, last_name, max(hire_date) from employees;

-- Show the average unit price rounded to 2 decimal places, the total units in stock, total discontinued products from the products table.

select round(avg(unit_price), 2), sum(units_in_stock), sum(discontinued) from products;

-- Show the ProductName, CompanyName, CategoryName from the products, suppliers, and categories table

select p.product_name, s.company_name, c.category_name from products as p join suppliers as s 
on p.supplier_id = s.supplier_id join categories c on p.category_id = c.category_id;

-- Show the category_name and the average product unit price for each category rounded to 2 decimal places.

select c.category_name, round(avg(p.unit_price), 2) from products as p join categories as c 
on p.category_id = c.category_id group by c.category_name;

-- Show the city, company_name, contact_name from the customers and suppliers table merged together.
-- Create a column which contains 'customers' or 'suppliers' depending on the table it came from.

select city, company_name, contact_name, 'customers' as relationship from customers
union select city, company_name, contact_name, 'suppliers' as relationship from suppliers;

-- Show the total amount of orders for each year/month.

select year(order_date), month(order_date), count(order_id) from orders group by year(order_date), month(order_date);