CREATE TABLE IF NOT EXISTS food(
	p_id VARCHAR(10) NOT NULL,
	p_name VARCHAR(20),
	p_unitPrice INTEGER,
	p_description TEXT,
	p_category VARCHAR(20),
	p_unitsInStock LONG,
	p_fileName VARCHAR(20),
	PRIMARY KEY (p_id)
)default CHARSET = utf8;

drop table food;

show databases;

show tables;

select * from food;

delete from food where p_id = 'F1000';

desc food;