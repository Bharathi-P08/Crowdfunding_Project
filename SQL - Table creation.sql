Create database project;
Use project;
CREATE TABLE crowdfunding_projects (
    id BIGINT PRIMARY KEY,
    state VARCHAR(50),
    name TEXT,
    country VARCHAR(10),
    creator_id BIGINT,
    location_id BIGINT,
    category_id INT,
    created_date DATE,
    deadline_date DATE,
    updated_at_date DATE,
    state_changed_date DATE,
    successful_date DATE,
    launched_date DATE,
    goal DECIMAL(15,2),
    pledged DECIMAL(15,2),
    currency VARCHAR(10),
    currency_symbol VARCHAR(10),
    usd_pledged DECIMAL(15,2),
    static_usd_rate DECIMAL(10,6),
    backers_count INT,
    spotlight BOOLEAN,
    staff_pick BOOLEAN,
    blurb TEXT,
    currency_trailing_code BOOLEAN,
    disable_communication BOOLEAN
    
);
ALTER TABLE crowdfunding_projects
  ADD COLUMN goal_usd DECIMAL(15,2);
SET SQL_SAFE_UPDATES = 0;
UPDATE crowdfunding_projects
SET goal_usd = goal * static_usd_rate
WHERE goal IS NOT NULL AND static_usd_rate IS NOT NULL;  

select * from crowdfunding_projects;

CREATE TABLE location (
id BIGINT PRIMARY KEY,
    displayable_name VARCHAR(30),
    type VARCHAR(20),
    name varchar(20),
    state varchar(10),
    short_name varchar(20),
    is_root boolean,
    country varchar(10),
    localized_name varchar(20)
    );
select * from location;

CREATE TABLE creator (
 id BIGINT PRIMARY KEY,
    name TEXT,
    chosen_currency VARCHAR(10)
    );
select * from creator;

CREATE TABLE calendar (
  id BIGINT PRIMARY KEY,
  created_date date,
  Year INT,
  Month INT,
  MonthName VARCHAR(20),
  Weekdaynum VARCHAR(3),
  Yearmonth VARCHAR(10),
  Weekdayname VARCHAR(20),
  Quarter VARCHAR(6),
  Financialmonth VARCHAR(6),
  FinancialQuarter VARCHAR(8)
);



