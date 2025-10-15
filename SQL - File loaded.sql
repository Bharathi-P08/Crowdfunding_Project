Use project;
LOAD DATA LOCAL INFILE 'C:/Users/bharu/OneDrive/Desktop/Project Dataset CSV file/Calendar.csv'
INTO TABLE calendar
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
Select * from calendar;

LOAD DATA LOCAL INFILE 'C:/Users/bharu/OneDrive/Desktop/Project Dataset CSV file/Crowdfunding_projects.csv'
INTO TABLE crowdfunding_projects
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
Select * from crowdfunding_projects;

LOAD DATA LOCAL INFILE 'C:/Users/bharu/OneDrive/Desktop/Project Dataset CSV file/Crowdfunding_Location.csv'
INTO TABLE location
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
Select * from location;

LOAD DATA LOCAL INFILE 'C:/Users/bharu/OneDrive/Desktop/Project Dataset CSV file/Crowdfunding_Creator.csv'
INTO TABLE creator
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
Select * from creator;

select *from category;
ALTER TABLE category
CHANGE COLUMN `ï»¿id` id INT; 