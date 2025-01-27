use project_sql;
select * from project_sql.dataset1project;
rename table dataset2p to dataset2project;
select * from project_sql.dataset2project;

-- Count the total rows

select count(*) from project_sql.dataset1project;
select count(*) from project_sql.dataset2project;

-- dataset for the jharkhand and bihar

select * from project_sql.dataset1project where State in ('jharkhand' , 'bihar');

-- population of the india

select sum(population) as population from project_sql.dataset2project;

-- average growth 

select avg(growth) avg_growth from project_sql.dataset1project;
select state,avg(growth) avg_growth from project_sql.dataset1project group by State;

-- avg sex ratio 
select state, round(avg(Sex_Ratio),0) avg_sex_ratio from project_sql.dataset1project group by State order by avg_sex_ratio desc;

-- avg literacy rate
select state, round(avg(literacy),0) avg_literacy_ratio from project_sql.dataset1project group by State order by avg_literacy_ratio desc;

select state, round(avg(literacy),0) avg_literacy_ratio from project_sql.dataset1project 
group by State having round(avg(literacy),0)>90 order by avg_literacy_ratio desc ;

-- top 3 states showing highest growth ratio
select state,avg(growth) avg_growth from project_sql.dataset1project group by State order by avg_growth desc limit 3;

-- bottom 3 states showing lowest sex ratio
 
 select state, round(avg(Sex_Ratio),0) avg_sex_ratio from project_sql.dataset1project group by State order by avg_sex_ratio asc limit 3;
 
 -- top and bottom 3 state in literacy rate
 drop table if exsist topstate;
 create table topstate(state varchar (225), avg_literacy_ratio float);
 insert into topstate (state, avg_literacy_ratio)
select state, round(avg(literacy), 0) as avg_literacy_ratio
from project_sql.dataset1project
group by state
order by avg_literacy_ratio desc;

select * from topstate limit 3

 drop table if exsist bottomstate;
 create table bottomstate(state varchar (225), avg_literacy_ratio float);
 insert into bottomstate (state, avg_literacy_ratio)
select state, round(avg(literacy), 0) as avg_literacy_ratio
from project_sql.dataset1project
group by state
order by avg_literacy_ratio desc;

select * from bottomstate limit 3

-- union the tables

select *  from (
select * from topstate limit 3) a
union
select * from (
select * from bottomstate limit 3)b

-- states starting with the letter m

select distinct state from project_sql.dataset1project where lower(state) like 'm%'
select distinct state from project_sql.dataset1project where lower(state) like 'm%' or lower(state) like 'a%'

select distinct state from project_sql.dataset1project where lower(state) like 'm%' and lower(state) like '%h'

