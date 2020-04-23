-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

select product.ProductName, product.CategoryId
from product

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

select orders.Id, shipper.CompanyName
from orders
join shipper 
where orders.OrderDate < "2012-08-09"

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

select product.ProductName, (product.QuantityPerUnit * product.UnitsOnOrder) as Total
from product
join orders
where orders.Id = 10251
order by product.ProductName;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

select orderDetail.OrderId, customer.CompanyName, employee.LastName
from orderDetail
join customer on customer.Id = orders.CustomerId
join employee on employee.Id = orders.EmployeeId
join orders on orders.Id = orderDetail.OrderId