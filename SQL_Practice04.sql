-- Laptop vs. Mobile Viewership 
SELECT
SUM(Case
 WHEN device_type ='laptop' THEN 1
 ELSE 0
End) as LAPTOP_VIEWS,
SUM(Case
 WHEN device_type IN ('tablet','phone') THEN 1
 ELSE 0
End) as mobile_views
FROM viewership

--610. Triangle Judgement
select *,
case
when x<y+z and y<x+z and z<x+y then 'Yes'
Else 'No'
End as Triangle
 from TRIANGLE

--Patient Support Analysis (Part 2)
WITH A AS
(SELECT sum (CASE
 WHEN call_category is NULL or call_category='n/a' THEN 1
 ELSE 0
 END) as null_values,
COUNT(case_id) as total_call
FROM callers)

SELECT ROUND(100* null_values/total_call,1) as call_percent
from A;

--584. Find Customer Referee
Select name
from Customer 
where referee_id !=2 or referee_id is null

--Make a report showing the number of survivors and non-survivors by passenger class
select distinct titanic.survived,
Sum(case
 when titanic.pclass = 1 then 1
 else 0
End) as first_class,
Sum(case
 when titanic.pclass = 2 then 1
 else 0
End) as second_classs,
Sum(case
 when titanic.pclass = 3 then 1
 else 0
End) as  third_class
from titanic
group by titanic.survived
order by titanic.survived


--Make a report showing the number of survivors and non-survivors by passenger class
