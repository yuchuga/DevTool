-- Shows all tables in database
show tables;
describe seller;

-- Shows Seller_Name column
select * from seller;
select seller_name as "Seller_Name" from seller as s; 
select seller.seller_name from seller;

-- Exercise 1
show tables;
show columns from customer;
select * from customer;
select  product_id, product_name from product;
show columns from transaction;
select  transaction_datetime, customer_id, product_id, transaction_amount from transaction;

-- WHERE clause
select * from customer
where customer_type = 1;
select * from customer 
where customer_wallet = 7000 
and customer_type = 0;

-- ORDER BY clause. ASC is default
select * from customer 
order by customer_wallet, customer_name desc;

-- IN clause
select * from customer 
where customer_tolerance in (0.7, 0.6, 0.5);

-- LIMIT keyword
select * from customer
limit 5;

-- Exercise 2
show columns from customer;
select * from customer
where customer_wallet > 5000
and customer_tolerance > 0.7;

select * from customer
where customer_wallet > 5000
and customer_tolerance > 0.7
order by customer_wallet desc;

select * from transaction
where customer_id in (1, 3, 5, 7, 9);

select * from customer
where customer_id in (1, 3, 5, 7, 9)
order by customer_wallet desc 
limit 5;

-- FUNCTIONS
select count(*) as "Total records for 0 type" from customer
where customer_type = 0;
select now();
select avg(customer_wallet) as "average wallet" from customer;
select 
    min(customer_wallet) as "Min Balance",
    max(customer_wallet) as "Max Balance" 
from customer
group by customer_type;

-- Exercise 3
select * from customer;
-- highest balance for each tolerance level
select max(customer_wallet) from customer
group by customer_tolerance;

-- average balance for each customer type
select avg(customer_wallet) from customer
group by customer_type;

-- No of items sold for each product
select * from transaction;
select sum(transaction_quantity) as "Item Sold" from transaction 
group by product_id;

-- INNER JOIN
select t.transaction_datetime, s.seller_name,
    t.transaction_quantity, t.transaction_amount
    from transaction as t
    inner join seller as s
    on t.seller_id = s.seller_id;

-- LEFT JOIN
select t.transaction_datetime, s.seller_name,
    t.transaction_quantity, t.transaction_amount
    from transaction as t
    left join seller as s
    on t.seller_id = s.seller_id;

-- RIGHT JOIN
select max(t.transaction_datetime), s.seller_name,
    t.transaction_quantity, t.transaction_amount
    from transaction as t
    right join seller as s
    on t.seller_id = s.seller_id;
    
-- Exercise 4
describe transaction;
describe customer;
describe seller;
describe stock;
-- All transactions from each customer with customer name
select c.customer_name, t.transaction_datetime,
    t.transaction_quantity, t.transaction_amount
    from transaction as t
    left join customer as c
    on t.customer_id = c.customer_id;

-- Last transaction date for each customer
select c.customer_name, max(t.transaction_datetime),
    t.transaction_quantity, t.transaction_amount
    from transaction as t
    left join customer as c
    on t.customer_id = c.customer_id
    group by customer_name;

-- Average transaction from sellers
select t.transaction_datetime, s.seller_name,
    t.transaction_quantity, avg(t.transaction_amount)
    from transaction as t
    left join seller as s
    on t.seller_id = s.seller_id
    group by seller_name;

-- JOIN 3 tables. Average earnings from sellers
select t.transaction_datetime, s.seller_name,
    t.transaction_quantity, t.transaction_amount, st.stock_cost, AVG(t.transaction_amount-st.stock_cost) as earnings
    from transaction as t
    left join seller as s
    on t.seller_id = s.seller_id
    inner join stock as st
    on t.product_id = st.product_id 
    group by seller_name;

select * from customer
where customer_name like 'a%';

