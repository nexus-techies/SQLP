


DELIMITER //
Create procedure view_available_books()
begin
	Select * from books_authors;
end //
DELIMITER ;
-- CALL view_available_books()

DELIMITER //
Create procedure Search_booktype(IN input varchar(50))
begin
	Select * from books_authors where book_type = input ; 
end //
DELIMITER ;
-- CALL Search_booktype("Romance")

DELIMITER //
Create procedure Search_bookname(IN input varchar(50))
begin
	Select * from books_authors where book_name = input ; 
end //
DELIMITER ;
-- CALL Search_bookname("Snow White")

DELIMITER //
Create procedure Search_bookAuthor(IN input varchar(50))
begin
	Select * from books_authors where author_name = input ; 
end //
DELIMITER ;
-- CALL Search_bookAuthor("William");



DELIMITER //
Create procedure check_stock_min(IN input integer)
begin
	Select book_name, author_name, book_type, book_price, book_stock from Order_placed where book_stock <= input ; 
end //
DELIMITER ;
-- CALL check_stock_min(300);

DELIMITER //
Create procedure check_book_by_price(IN input integer)
begin
	Select book_name, author_name, book_type, book_price, book_stock from Order_placed where book_price <= input ; 
end //
DELIMITER ;
-- CALL check_book_by_price(300);


delimiter //
create procedure disp_price(OUT b_price integer, IN b_name varchar(60) )  
                      begin 
                      select (order_quantity * b_price) into b_price
                         FROM order_placed where book_name = b_name;   
                      end; //
delimiter ;
-- call disp_price(@P, "Snow White");
-- select @P;


delimiter //
create procedure getInvoice(IN b_name varchar(60), IN order_quantity int, OUT totalInvoice INT)  
                      begin 
                      select (book_price * order_quantity)  INTO totalInvoice
                         FROM books_authors where book_name = b_name;   
                      end; //
delimiter ;


delimiter //
create procedure AddCustomers(IN c_name varchar(60),IN c_address varchar(60), IN c_phone varchar(60), IN b_name VARCHAR(50), IN o_quantity INT)  
                      begin 
                      insert into customers set customer_name=c_name, customer_address=c_address, customer_phone=c_phone;
					  insert into orders(customer_id, book_id, order_quantity) values((select customer_id from customers where customer_name=c_name), (select book_id from books where book_name=b_name),o_quantity);
                      end; //
delimiter ;


delimiter //
create procedure DeleteCustomers(IN c_name varchar(60))  
                      begin 
                      delete from orders where customer_id= (select customer_id from customers where customer_name=c_name);
                      delete from customers where customer_name=c_name;
                      end; //
delimiter ;


delimiter //
create procedure UpdateCustomerAddress(IN c_name varchar(60),IN c_address varchar(60))  
                      begin 
                      update customers set customer_address=c_address where customer_name=c_name ;
                      end; //
delimiter ;

delimiter //
create procedure UpdateCustomerPhoneIN (IN c_name varchar(60), IN c_phone varchar(60))  
                      begin 
                      update customers set customer_phone=c_phone where customer_name=c_name ;
                      end; //
delimiter ;

