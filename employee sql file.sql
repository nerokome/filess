create database project;

select * from hr;
describe hr;
alter table hr
change column ï»¿id emp_id varchar(20)null;


set sql_safe_updates = 0;

update hr
set birthdate = case
 when birthdate like '%/%' then date_format(str_to_date(birthdate,'%m/%d/%Y'),'%Y-%m-%d')
  when birthdate like '%-%' then date_format(str_to_date(birthdate,'%m-%d-%Y'),'%Y-%m-%d')
  else null
  end;
  
  alter table hr
  modify column birthdate date;
  
  alter table hr
  add column age int;
  
  update hr
  set age = timestampdiff(year, birthdate, curdate());
  
  select birthdate, age from hr;
  select max(age) as oldest, min(age) as youngest from hr;
  
  select gender, count(*) as count from hr
  where age >= 18 and termdate = ''
  group by gender
  order by count desc;
  
  select race, count(*) as count from hr 
  where age >= 18 and termdate = ''
  group by race
  order by count desc;
  
  select min(age) as youngest,
        max(age) as oldest from hr
         where age >= 18 and termdate = '';
         
    select 
    case 
    when age >=18 and age <=24 then '18-24'
	when age >=25 and age <=34 then '25-34'
	when age >=35 and age <=44 then '35-44'
	when age >=45 and age <= 54 then '45-54'
	when age >=54 and age <=24 then '55-64'
    else '65'
    end as age_group,
    count(*) as count
    from hr
	where age >= 18 and termdate = ''
    group by age_group
    order by age_group;
    
     select 
    case 
    when age >=18 and age <=24 then '18-24'
	when age >=25 and age <=34 then '25-34'
	when age >=35 and age <=44 then '35-44'
	when age >=45 and age <= 54 then '45-54'
	when age >=54 and age <=24 then '55-64'
    else '65'
    end as age_group,gender,
    count(*) as count
    from hr
	where age >= 18 and termdate = ''
    group by age_group,gender
    order by age_group,gender;
    
    select location, count(*) as comp from hr
    where age >= 18 and termdate = ''
    group by location;
    
    select round(avg(datediff(termdate,hire_date))/365,0) as avg_length from hr
    where termdate<= curdate() and termdate <> '' and age >= 18;
    
    select department, gender, count(*) as count
    from hr
     where age >= 18 and termdate = ''
     group by department,gender
     order by department ;
     
     select jobtitle,count(*) as count
     from hr
      where age >= 18 and termdate = ''
     group by jobtitle
     order by jobtitle desc;
     
     select count(*) from hr;
     
     select department,total_count,terminated_count,
     terminated_count/total_count as termination_rate
     from (select department,
     count(*) as total_count,
     sum(case when termdate <> '' and termdate <= curdate() then 1 else 0 end) as terminated_count
     from hr 
     where age >= 18
     group by department) as subquery
     order by termination_rate desc;
     
     select * from hr;
     
     
     
    
  
  
  
  update hr
set hire_date = case
 when hire_date like '%/%' then date_format(str_to_date(hire_date,'%m/%d/%Y'),'%Y-%m-%d')
  when hire_date like '%-%' then date_format(str_to_date(hire_date,'%m-%d-%Y'),'%Y-%m-%d')
  else null
END;

alter table hr
  modify column hire_date date;
SELECT hire_date from hr;

update hr
set termdate = date(str_to_date(termdate,'%Y-%m-%d %H:%i:%s UTC'))
WHERE termdate is not null and termdate!= '';
SELECT termdate from hr;

alter table hr
modify column termdate date;
  
  
