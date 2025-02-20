
select * from ready;
select distinct manager from ready;
select Payment_Method, count(*) as count from ready
group by Payment_Method;
select count(*) as sales from ready;
select product, count(*) as count from ready
group by product;
select Purchase_Type, count(*) as count from ready
group by purchase_Type;
select Month, count(*) from ready   
group by Month;


select City, count(*) from ready
group by city;
select  manager, City from ready
group by manager;


set sql_safe_update = 0;

alter table ready
add column Revenue int;

update ready
set Revenue = Quantity*Price;

update ready
set date = date(str_to_date(date,'%d/%m/%Y'));

alter table ready
modify column date date;

select round(avg(Revenue),0) from ready;
select manager, sum(Revenue) from ready
group by manager;


select Payment_Method, count(*) as count from ready;
select purchase_type, count(*) as count from ready;



