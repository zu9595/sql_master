select avg(salary), max(salary), min(salary), sum(salary) --count(*)을 제외한 나머지 그룹함수는 null값을 무시
From employees
where job_id like '%REP%';

select min(hire_date), max(hire_date)
from employees;

select min(last_name), max(last_name)
from employees;

select count(*)
from employees;

select count(*)
from departments;

select count(*)
from employees
where department_id = 50;

select count(commission_pct)
from employees
where department_id = 80;

select count(distinct department_id), count(department_id)
from employees;

select distinct department_id
from employees;

select avg(nvl(commission_pct, 0)), avg(commission_pct)
from employees;

select department_id, avg(salary)
from employees
group by department_id; --그룹함수와 일반 컬럼을 같이 쓸 경우 그룹바이를 써야함

select avg(salary)
from employees
group by department_id;

select department_id, job_id, sum(salary)
from employees
group by department_id, job_id
order by job_id;

select department_id, job_id, sum(salary)
from employees
where department_id > 40
group by department_id, job_id
order by department_id;

select department_id, max(salary)
from employees
group by department_id
having max(salary)>10000;

select job_id, sum(salary) payroll
from employees
where job_id not like '%REP%'
group by job_id
having sum(salary) > 13000
order by sum(salary);

select max(avg(salary))
from employees
group by department_id;

select department_id, max(avg(salary)) --그룹함수를 중첩할 경우 어떠한 일반 컬럼도 사용할 수 없다.
from employees
group by department_id;

--4
select round(max(salary)) "Maximum", 
        round(min(salary)) "Minimum", 
        round(sum(salary)) "Sum", 
        round(avg(salary)) "Average"
from employees;
--5
select job_id, round(max(salary)) "Maximum", 
        round(min(salary)) "Minimum", 
        round(sum(salary)) "Sum", 
        round(avg(salary)) "Average"
from employees
group by job_id;
--6
select job_id, count(*)
from employees
group by job_id;
--7
select count(distinct manager_id) "Number of Managers"
from employees;
--8
select max(salary)-min(salary) difference
from employees;
--9
select manager_id, min(salary)
from employees
where not manager_id is null
group by manager_id
having min(salary) >= 6000
order by min(salary) desc;

select last_name, department_name
from employees, departments; --카테시안 프로덕트

select e.employee_id, e.last_name, e.department_id, d.department_id, d.location_id 
from employees e, departments d
where e.department_id = d.department_id;

select e.employee_id, e.last_name, e.department_id, d.department_id, d.location_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id;

select employee_id, last_name, e.department_id, d.department_id, location_id, department_name
from employees e, departments d
where e.department_id = d.department_id;

select d.department_id, d.department_name, d.location_id, l.city
from departments d, locations l
where d.location_id = l.location_id;

select d.department_id, d.department_name, d.location_id, l.city
from departments d, locations l
where d.location_id = l.location_id
and d.department_id in (20, 50);

select *from job_grades; --비교용 테이블

select e.last_name, e.salary, j.grade_level
from employees e, job_grades j
where e.salary between j.lowest_sal and j.highest_sal;

select e.last_name, e.department_id, d.department_name
from employees e, departments d
where e.department_id(+) = d.department_id;

select e.last_name, e.department_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id(+);

select employee_id, last_name, manager_id
from employees;

select worker.last_name || ' works for ' || manager.last_name
from employees worker, employees manager
where worker.manager_id = manager.employee_id;

select last_name, department_name
from employees cross join departments; --표준식 크로스 조인(카테시안 프로덕트)

select department_id, department_name, location_id, city
from departments natural join locations; --잘안씀

select employee_id, last_name, location_id, department_id
from employees join departments using(department_id);

select l.city, d.department_name
from locations l join departments d using(location_id)
where location_id = 1400;
--using은 where xxx.xx로 사용불가
----------------------
select e.employee_id, e.last_name, e.department_id, 
        d.department_id, d.location_id
from employees e join departments d
on(e.department_id = d.department_id);
--oracle
select e.employee_id, e.last_name, e.department_id, 
        d.department_id, d.location_id
from employees e, departments d
where e.department_id = d.department_id;
----------------------
select employee_id, city, department_name
from employees e
        join departments d
        on d.department_id = e.department_id
        join locations l
        on d.location_id = l.location_id;
--oracle
select employee_id, city, department_name
from employees e, departments d, locations l
where d.department_id = e.department_id
and d.location_id = l.location_id;
----------------------
select e.last_name, e.department_id, d.department_name
from employees e left outer join departments d
        on(e.department_id = d.department_id);
--oracle
select e.last_name, e.department_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id(+);
----------------------
select e.last_name, e.department_id, d.department_name
from employees e right outer join departments d
        on(e.department_id = d.department_id);
--oracle
select e.last_name, e.department_id, d.department_name
from employees e, departments d
where e.department_id(+) = d.department_id;
----------------------
select e.last_name, e.department_id, d.department_name
from employees e full outer join departments d --full outer join은 오라클에선 지원안함
        on(e.department_id = d.department_id);
        
select e.last_name, e.department_id, d.department_name
from employees e join departments d
        on(e.department_id = d.department_id)
and e.manager_id = 149;

select e.last_name, e.department_id, d.department_name
from employees e join departments d
        on(e.department_id = d.department_id)
where e.manager_id = 149;
--1
select l.location_id, l.street_address, l.city, l.state_province, c.country_name
from locations l, countries c
where l.country_id = c.country_id;
--2
select e.last_name, e.department_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id;
--3
select e.last_name, j.job_title, d.department_id, d.department_name
from employees e, jobs j, departments d, locations l
where e.department_id = d.department_id
and j.job_id = e.job_id
and l.location_id = d.location_id
and lower(l.city) = 'toronto';
--4
select e1.last_name "Employee", e1.employee_id "Emp#", e2.last_name "Manager", e2.manager_id "Mgr#"
from employees e1, employees e2
where e2.employee_id = e1.manager_id;
--5
select e1.last_name "Employee", e1.employee_id "Emp#", e2.last_name "Manager", e2.manager_id "Mgr#"
from employees e1, employees e2
where e2.employee_id(+) = e1.manager_id
order by 2;
--6
select *
from job_grades;
select e.last_name, j.job_title, d.department_name, e.salary, jg.grade_level
from employees e, jobs j, departments d, job_grades jg
where e.job_id = j.job_id 
and e.department_id = d.department_id 
and e.salary between jg.lowest_sal and jg.highest_sal;


--서브쿼리
select last_name, salary
from employees
where salary in (select max(salary)
                    from employees
                    group by department_id); --다중 행값이면 다중 비교 연산자
                    
select max(salary)
from employees
group by department_id;

select last_name, salary
from employees
where salary > (select salary
                from employees
                where last_name = 'Abel'); --단일 행값이면 단일 비교 연산자

select employee_id, last_name, job_id
from employees
where job_id = (select job_id
                from employees
                where employee_id = 141);
--and employee_id != 141;

select last_name, job_id, salary
from employees
where job_id = (select job_id
                from employees
                where last_name = 'Abel')
and salary > (select salary
                from employees
                where last_name = 'Abel');