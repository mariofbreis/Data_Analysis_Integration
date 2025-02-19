
DROP DATABASE IF EXISTS steelwheels_dw;
CREATE DATABASE steelwheels_dw;

USE steelwheels_dw;

CREATE TABLE dim_customer (
	CUSTOMERNUMBER INT,
	CUSTOMERNAME VARCHAR(255),
	CITY VARCHAR(255),
	COUNTRY VARCHAR(255),
	PRIMARY KEY (CUSTOMERNUMBER)
);

CREATE TABLE dim_product (
	PRODUCT_ID INT,
	PRODUCTCODE VARCHAR(255),
	PRODUCTNAME VARCHAR(255),
	PRODUCTLINE VARCHAR(255),
	PRODUCTVENDOR VARCHAR(255),
	VERSION INT,
	DATE_FROM DATETIME,
	DATE_TO DATETIME,
	PRIMARY KEY (PRODUCT_ID)
);

CREATE TABLE dim_time (
	TIME_ID DATETIME,
	YEAR_ID INT,
	QTR_ID INT,
	QTR_NAME VARCHAR(255),
	MONTH_ID INT,
	MONTH_NAME VARCHAR(255),
	PRIMARY KEY (TIME_ID)
);

CREATE TABLE fact_order (
	ORDERNUMBER INT,
	ORDERLINENUMBER INT,
	QUANTITYORDERED INT,
	PRICEEACH DOUBLE,
	LINETOTAL DOUBLE,
	CUSTOMERNUMBER INT,
	PRODUCT_ID INT,
	TIME_ID DATETIME,
	PRIMARY KEY (ORDERNUMBER,ORDERLINENUMBER),
	FOREIGN KEY (CUSTOMERNUMBER) REFERENCES dim_customer (CUSTOMERNUMBER),
	FOREIGN KEY (PRODUCT_ID) REFERENCES dim_product (PRODUCT_ID),
	FOREIGN KEY (TIME_ID) REFERENCES dim_time (TIME_ID)
);
