CREATE DATABASE crowdfunding_db
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LOCALE_PROVIDER = 'libc'
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

DROP TABLE campaign;
DROP TABLE contacts;
DROP TABLE category;
DROP TABLE subcategory;

--Create a table of contacts
CREATE TABLE contacts (
	contact_id INTEGER NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(70) NOT NULL,
	PRIMARY KEY (contact_id)
);
--Create a table of categories
CREATE TABLE category (
	category_id VARCHAR(4) NOT NULL,
	category_name VARCHAR(20) NOT NULL,
	PRIMARY KEY (category_id)
);
--Create a table of subcategories
CREATE TABLE subcategory (
	subcategory_id VARCHAR(8) NOT NULL,
	subcategory_name VARCHAR(20) NOT NULL,
	PRIMARY KEY (subcategory_id)
);
---Create a table of campaigns
CREATE TABLE campaign(
	cf_id INTEGER NOT NULL,
	contact_id INTEGER NOT NULL,
	company_name VARCHAR(70) NOT NULL,
	description VARCHAR(200) NOT NULL,
	goal FLOAT8 NOT NULL,
	pledged FLOAT8 NOT NULL,
	outcome VARCHAR(10) NOT NULL,
	backers_count INTEGER NOT NULL,
	country VARCHAR(2) NOT NULL,
	currency VARCHAR(3) NOT NULL,
	launched_date DATE NOT NULL,
	end_date DATE NOT NULL,
	category_id VARCHAR(4) NOT NULL,
	subcategory_id VARCHAR(8) NOT NULL,
	PRIMARY KEY (cf_id),
	FOREIGN KEY (contact_id) REFERENCES contacts(contact_id),
	FOREIGN KEY (category_id) REFERENCES category(category_id),
	FOREIGN KEY (subcategory_id) REFERENCES subcategory(subcategory_id)
);
---Check to see the data is there
SELECT * FROM contacts
SELECT * FROM category
SELECT * FROM subcategory
SELECT * FROM campaign