# Write your MySQL query statemen
with rankoversalaries as(select departmentId,
name as Employee,
Salary,
Dense_Rank() over(
    partition by departmentId
    order by Salary desc
)as rnk
from Employee e 
)

select d.name as Department,rk.Employee,rk.Salary from
rankoversalaries rk 
join Department d on rk.departmentId = d.id
 where rnk <= 3;
