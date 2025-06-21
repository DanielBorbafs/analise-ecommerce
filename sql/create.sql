
CREATE TABLE customers(
customer_id VARCHAR(100) PRIMARY KEY,
customer_unique_id VARCHAR(50),
customer_zip_code_prefix VARCHAR(50),
customer_city VARCHAR(50),
customer_state CHAR(2)
);
GO

CREATE TABLE products(
	product_id VARCHAR(50) PRIMARY KEY,
	product_category_name VARCHAR(50),
	product_name_length VARCHAR(50),
	product_description_length VARCHAR(50),
	product_photos_qty INT,
	product_weight_g DECIMAL(10,2),
	product_length_cm DECIMAL(6,2),
	product_height_cm DECIMAL(6,2),
	product_width_cm DECIMAL(6,2)
);
GO


ALTER TABLE PRODUCTS
DROP COLUMN product_length_cm;
go

ALTER TABLE PRODUCTS
DROP COLUMN product_height_cm
GO

ALTER TABLE PRODUCTS
DROP COLUMN product_width_cm
GO


CREATE TABLE sellers(
	seller_id VARCHAR(50)PRIMARY KEY,
	seller_zip_code_prefix VARCHAR(50),
	seller_city VARCHAR(50),
	seller_state CHAR(2)
)
GO


CREATE TABLE orders(
	order_id VARCHAR(100) PRIMARY KEY,
	customer_id VARCHAR(100),
	order_status VARCHAR(30),
	order_purchase_timestamp DATE,
	order_approved_at DATE,
	order_delivered_carrier_date DATE,
	order_delivered_customer_date DATE,
	order_estimated_delivery_date DATE,
	FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
)
GO


CREATE TABLE orders_payments(
	order_id VARCHAR(100),
	payment_sequential INT,
	payment_type VARCHAR(30),
	payment_installments INT,
	payment_value DECIMAL(10,2),
	FOREIGN KEY(order_id) REFERENCES orders(order_id)
)
GO


CREATE TABLE order_items(
	order_item_id INT,
	order_id VARCHAR(100),
	product_id VARCHAR(50),
	seller_id VARCHAR(50),
	shipping_limit_date DATE,
	price DECIMAL(10,2),
	freight_value DECIMAL(10,2),
	FOREIGN KEY(order_id) REFERENCES orders(order_id),
	FOREIGN KEY (product_id) REFERENCES products(product_id),
	FOREIGN KEY (seller_id) REFERENCES sellers(seller_id)

)
GO


CREATE TABLE reviews (
    review_id VARCHAR(100),
    order_id VARCHAR(100),
    review_score INT,
    review_comment_title NVARCHAR(255),         -- aceita acentos e é um pouco maior
    review_comment_message NVARCHAR(MAX),       -- para mensagens longas com segurança
    review_creation_date DATE,
    review_answer_timestamp DATETIME,
	FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
GO

