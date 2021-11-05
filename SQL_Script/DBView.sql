create view books_authors as
select a.author_name, b.book_name, b.book_type, b.book_id, b.book_stock, b.book_price
from authors a, books b
where b.author_id = a.author_id;


CREATE view Order_placed AS 
select  o.order_id, o.order_date, o.customer_id, o.book_id, o.store_id, o.order_quantity, 
		c.customer_name, c.customer_address, c.customer_phone, 
		v.author_name, v.book_name, v.book_type, v.book_stock, v.book_price 
from orders o
left join customers as c
on o.customer_id = c.customer_id
left join books_authors as v
on o.book_id = v.book_id;

