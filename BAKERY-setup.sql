DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS receipts;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS goods;

-- CId: unique identifier of the customer
-- LastName: last name of the customer
-- FirstName: first name of the customer
CREATE TABLE customers(
    CId int PRIMARY KEY,
    LastName varchar(100) NOT NULL,
    FirstName varchar(100) NOT NULL
);

SELECT * FROM customers;

-- GId: unique identifier of the baked good
-- Flavor: flavor/type of the good (e.g., "chocolate", "lemon")
-- Food: category of the good (e.g., "cake", "tart")
-- Price: price (in dollars) 
CREATE TABLE goods(
    GId varchar(100) PRIMARY KEY,
    Flavor varchar(100) NOT NULL,
    Food varchar(100) NOT NULL,
    Price decimal(20,2) NOT NULL,
    UNIQUE(Food, Flavor)
);

SELECT * FROM goods;

-- RNumber : unique identifier of the receiipt
-- SaleDate : date of the purchase. 
-- Customer : id of the customer (see customers.Id)

CREATE TABLE receipts(
    RNumber int PRIMARY KEY,
    SaleDate date NOT NULL,
    Customer int NOT NULL,
    FOREIGN KEY (Customer) references customers(CId)
);


SELECT * FROM receipts;

-- Receipt : receipt number 
-- Ordinal : position of the purchased item on the
--               receipts. (i.e., first purchased item,
--               second purchased item, etc...)
-- Item: identifier of the item purchased (see goods.Id)

CREATE TABLE items(
    Receipt int NOT NULL,
    Ordinal int NOT NULL,
    Item varchar(100) NOT NULL,
    PRIMARY KEY (Receipt, Ordinal),
    FOREIGN KEY (Receipt) references receipts(RNumber),
    FOREIGN KEY (Item) references goods(GId)
);

SELECT * FROM items;