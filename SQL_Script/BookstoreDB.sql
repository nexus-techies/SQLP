-- drop database Bookstore;
create database Bookstore;
use Bookstore;
-- drop database Bookstore;

create table authors(
	author_id varchar(20) primary key,
	author_name varchar(20) not null,
	author_email varchar(30) not null,
	author_commission DOUBLE not null
);

insert into authors(author_id, author_name, author_email, author_commission) values ('A1', 'William', 'William@gmail.com', 0.2);
insert into authors values ('A2', 'George R.', 'GeorgeR.@gmail.com', 0.1);
insert into authors values ('A3', 'Tiago S.', 'Tiago@gmail.com', 0.3);
insert into authors values ('A4', 'Stephen King', 'Stephen@gmail.com', 0.25);
insert into authors values ('A5', 'J.K. Rowling', 'Rowling@gmail.com', 0.15);
insert into authors values ('A6', 'J.R.R. Tolkien', 'Tolkien@gmail.com', 0.2);
insert into authors values ('A7', 'George Lucas', 'GeorgeLucas@gmail.com', 0.1);
-- SELECT * from authors;

create table books(
	book_id varchar(20) primary key,
	book_name varchar(50) not null,
	book_type varchar(20) not null,
	author_id varchar(20) not null,
	book_price INT not null,
	book_stock INT not null,
	FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

insert into books(book_id, book_name, book_type, author_id, book_price, book_stock) values ('B1', 'Snow White', 'Romance', 'A1', 20, 500);
insert into books values ('B2', 'Junkie', 'Psychology', 'A1' , 30 , 300);
insert into books values ('B3', 'Romeo and Julliet', 'Romance', 'A1' , 25 , 400);
insert into books values ('B4', 'Song of Ice and Fire', 'Fantasy', 'A2' , 26 , 200);
insert into books values ('B5', 'Total War', 'Action', 'A2' , 15 , 130);
insert into books values ('B6', 'Data Design', 'Learning', 'A3' , 100 , 300);
insert into books values ('B7', 'It', 'Horror', 'A4' , 18 , 200);
insert into books values ('B8', 'Harry Potter Collection', 'Fantasy and Drama', 'A5' , 20 , 300);
insert into books values ('B9', 'The lord of Rings', 'Fantasy', 'A6' , 21 , 150);
insert into books values ('B10', 'Star Wars', 'Science Fiction', 'A7' , 20 , 300);
-- SELECT * FROM books;

create table bookstore(
	store_id varchar(20) primary key default 'S1',
	store_name varchar(30) not null,
	store_address varchar(20) not null
);

insert into bookstore(store_id, store_name, store_address ) values ('S1', 'Dave book store', 'Q03 EY3');
-- SELECT * FROM bookstore;

create table customers(
	customer_id INT AUTO_INCREMENT primary key,
	customer_name varchar(20) not null,
	customer_address varchar(20) not null,
	customer_phone varchar(20) not null
);

insert into customers(customer_name, customer_address, customer_phone) values ('Cestar School', 'L6G 0W5', '647_XXXXX01');
insert into customers(customer_name, customer_address, customer_phone) values ('Bill Company', 'L0G 0W1', '647_XXXXX02');
insert into customers(customer_name, customer_address, customer_phone) values ('James', 'A37 4L1', '647_XXXXX03');
insert into customers(customer_name, customer_address, customer_phone) values ('David', 'L1F 4P5', '647_XXXXX04');
insert into customers(customer_name, customer_address, customer_phone) values ('Josh', 'F1R 0R1', '647_XXXXX05');
insert into customers(customer_name, customer_address, customer_phone) values ('Thomas', 'G1H 0R1', '647_XXXXX06');
insert into customers(customer_name, customer_address, customer_phone) values ('Fake', 'K1L 9K1', '647_XXXXX07');
insert into customers(customer_name, customer_address, customer_phone) values ('Lambton College', 'P1L 4W1', '647_XXXXX08');
insert into customers(customer_name, customer_address, customer_phone) values ('Jane', 'M1F M47', '647_XXXXX09');
insert into customers(customer_name, customer_address, customer_phone) values ('Tim', 'L01 PG3', '647_XXXXX10');
-- SELECT * FROM customers;


create table orders(
	order_id INT AUTO_INCREMENT primary key,
    	order_date DATETIME not null DEFAULT now(),
	customer_id varchar(20) not null,
	book_id varchar(20) not null,
	store_id varchar(20) not null default 'S1',
	order_quantity INT not null default 0,
        FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
	FOREIGN KEY (book_id) REFERENCES books(book_id),
	FOREIGN KEY (store_id) REFERENCES bookstore(store_id)
);

insert into orders(customer_id, book_id, store_id, order_quantity) values (1, 'B3', 'S1' , 2);
insert into orders(customer_id, book_id, store_id, order_quantity) values ( 3 , 'B3', 'S1' , 1);
insert into orders(customer_id, book_id, store_id, order_quantity) values ( 2 , 'B1', 'S1' , 2);
insert into orders(customer_id, book_id, store_id, order_quantity) values ( 4 , 'B4', 'S1' , 3);
insert into orders(customer_id, book_id, store_id, order_quantity) values (5 , 'B6', 'S1' , 1);
insert into orders(customer_id, book_id, store_id, order_quantity) values (6 , 'B2', 'S1' , 1);
insert into orders(customer_id, book_id, store_id, order_quantity) values (7 , 'B4', 'S1' , 2);
insert into orders(customer_id, book_id, store_id, order_quantity) values (7 , 'B6', 'S1' , 3);
insert into orders(customer_id, book_id, store_id, order_quantity) values (7 , 'B3', 'S1' , 1);
insert into orders(customer_id, book_id, store_id, order_quantity) values ( 8 , 'B6', 'S1' , 50);
insert into orders(customer_id, book_id, store_id, order_quantity) values ( 8 , 'B3', 'S1' , 35);
insert into orders(customer_id, book_id, store_id, order_quantity) values ( 9 , 'B4', 'S1' , 50);
insert into orders(customer_id, book_id, store_id, order_quantity) values ( 9, 'B7', 'S1' , 40);
insert into orders(customer_id, book_id, store_id, order_quantity) values (9, 'B10', 'S1' , 35);
insert into orders(customer_id, book_id, store_id, order_quantity) values ( 10 , 'B1', 'S1' , 35);
insert into orders(customer_id, book_id, store_id, order_quantity) values (10 , 'B2', 'S1' , 35);
-- select * from orders;

