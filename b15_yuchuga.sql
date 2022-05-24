CREATE table users (
    user_id INTEGER AUTO_INCREMENT,
    username VARCHAR (20),
    user_email VARCHAR(30),
    user_dob DATE,
    PRIMARY KEY (user_id)
);

show tables;
describe users;

-- Insert data into database
insert into 
    users (user_id, username, user_email, user_dob)
VALUES
    (1, "yuchuga", "t0923547@u.nus.edu", "1991-09-09"),
    (2, "Jasmine", "jasminetan@u.nus.edu", "1991-10-17");
select * from users;

delete from users;

-- Update
update users
set user_email = "t0923548@u.nus.edu"
where user_id = 1;

-- Exercise 1
CREATE table inventory (
    item_id INTEGER AUTO_INCREMENT,
    item_name VARCHAR (20),
    brand VARCHAR(20),
    price INTEGER,
    PRIMARY KEY (item_id)
);
describe inventory;

insert into 
    inventory (item_id, item_name, brand, price)
VALUES
    (1, "Abalone", "Moon", 30),
    (2, "Cereal", "Honeystars", 5.5),
    (3, "Milk", "Farmland", 2.5),
    (4, "Egg", "Pasar", 2.7),
    (5, "tomatoes", "Pasar", 1.5),
    (6, "Chocolate", "Dairy", 5);

select * from inventory;
delete from inventory
where brand = "Moon";
update inventory
set price = 2
where item_name = "tomatoes";

-- Modify Table
ALTER table inventory
drop column brand;

-- Assignment
-- sort books to unit price
select * from books
order by unit_price;

-- all purchase details after Jan 1 2020 titled Lord of the Rings
select transaction_id, timestamp, book_id, cust_id, quantity, b.title
    from purchases as p
    left join books as b
    on p.book_id = b.ISBN
    where timestamp > '2020-01-01'
    and title = 'Lord of the Rings';

-- how many books each customer purchase for each year
select id, first_name, last_name, year(p.timestamp) as year, p.quantity
    from customers as c
    left join purchases as p
    on c.id = p.transaction_id
    order by year;

SELECT
  cust_id, SUM(quantity), YEAR(timestamp)
FROM
  purchases
GROUP BY
  cust_id, YEAR(timestamp);

-- Top 3 most selling books
select title, sum(p.quantity) as total_quantity
    from books as b
    left join purchases as p
    on b.ISBN = p.book_id
    group by p.book_id
    order by total_quantity desc 
    limit 3;  

-- Author sold the most book
select author_name, sum(p.quantity) as total_quantity
    from purchases as p
    left join books as b
    on p.book_id = b.ISBN
    inner join authors as a
    on b.author_id = a.id
    group by author_name
    order by total_quantity desc
    limit 1;

-- Author with most revenue
select author_name, sum(p.quantity * b.unit_price) as total_revenue
    from purchases as p
    left join books as b
    on p.book_id = b.ISBN
    inner join authors as a
    on b.author_id = a.id
    group by a.id 
    order by total_revenue desc
    limit 1;  
    




