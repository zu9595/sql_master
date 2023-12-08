select last_name, job_id, department_id, hire_date
from employees
order by hire_date; --����(�⺻������ ��������[asc]), ���� �Ʒ��ʿ� ��

select last_name, job_id, department_id, hire_date
from employees
order by hire_date desc; --�������� ����

select employee_id, last_name, salary*12 annsal
from employees
order by annsal; --�ٲ� �÷��� �ν���

select last_name, job_id, department_id, hire_date
from employees
order by 3; -- select 3��° �÷��� �������� ����, �ȵǴ� ���α׷��� ����

select last_name, department_id, salary
From employees
order by department_id, salary desc; --���ִ� ������� ����

select employee_id, salary
from employees
order by hire_date; --�÷������ �����ʾƵ� �ش� �÷� �������� ���İ���

select employee_id, last_name, salary, department_id
from employees
where employee_id = &search_id; -- &xx : �ѹ� �Է� �ް� ������ ����

select employee_id, last_name, job_id, &column_name
from employees
where &condition
order by &order_column;

select employee_id, last_name, job_id, &&column_name -- &&xx : �ѹ� �����ϸ� ���� ���� ������
from employees
order by &column_name;

select employee_id, salary
from employees
order by &column_name;

undefine column_name; --������ ���� ���� �ʱ�ȭ

select *
from job_history;

select employee_id, job_id
from employees
union --���� �Ʒ��� �÷��� ���ļ� ���(�ߺ����� �ϳ��� ���)
select employee_id, job_id
from job_history;

select employee_id, job_id, department_id
from employees
union all --���� �Ʒ��� �÷��� �ߺ����� ���� ���ļ� ���ľ��� ���
select employee_id, job_id, department_id
from job_history
order by employee_id;

select employee_id, job_id
from employees
intersect --���� �Ʒ��� �÷����� �ߺ��� ���� 1���� ���
select employee_id, job_id
from job_history;

select employee_id, job_id
from job_history 
intersect 
select employee_id, job_id
from employees; --���Ʒ��� �ٲ� ����

select employee_id, job_id
from employees
minus --������ �Ʒ��� �÷��� �� ���� ���
select employee_id, job_id
from job_history;

select employee_id, job_id
from job_history 
minus
select employee_id, job_id
from employees;

desc dual;

select *
from dual;

select sysdate
from employees;

select sysdate
from dual;

select 'The job id for ' ||upper(last_name)||' is '||lower(job_id) as "EMPLOYEE DETAILS" --�빮�� �ҹ��� ���
from employees;