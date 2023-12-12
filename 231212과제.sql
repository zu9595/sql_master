--1. Zlotkey�� ������ �μ��� ���� ��� ����� �̸��� �Ի����� ǥ���ϴ� ���Ǹ� �ۼ��Ͻÿ�.
-- Zlotkey�� ������� �����Ͻÿ�.
select last_name, hire_date
from employees
where department_id = (select department_id
                        from employees
                        where last_name = 'Zlotkey')
and not last_name = 'Zlotkey';
--2. �޿��� ��� �޿����� ���� ��� ����� ��� ��ȣ�� �̸��� ǥ���ϴ� ���Ǹ� �ۼ��ϰ�
-- ����� �޿��� ���� ������������ �����Ͻÿ�.
select employee_id, last_name
from employees
where salary > (select avg(salary)
                from employees)
order by salary;
--3. �̸��� u�� ���Ե� �����
-- ���� �μ����� ���ϴ� ��� ����� ��� ��ȣ�� �̸��� ǥ���ϴ� ���Ǹ� �ۼ��ϰ� ���Ǹ� �����Ͻÿ�.
select employee_id, last_name
from employees
where department_id in (select department_id
                        from employees
                        where last_name like '%u%');
--4. �μ� ��ġ ID(location_id)�� 1700��
-- ��� ����� �̸�, �μ� ��ȣ �� ���� ID�� ǥ���Ͻÿ�.
select e.last_name, e.department_id, e.job_id
from employees e, locations l
where l.location_id = 1700;
--5. King���� �����ϴ�(manager�� King)
-- ��� ����� �̸��� �޿��� ǥ���Ͻÿ�.
select last_name, salary
from employees
where manager_id in (select employee_id
                    from employees
                    where last_name = 'King');
--6. Executive �μ��� ��� ����� ���� �μ� ��ȣ, �̸� �� ���� ID�� ǥ���Ͻÿ�.
select e.department_id, e.last_name, e.job_id
from employees e, departments d
where d.department_name = 'Executive';
--7. ��� �޿����� ���� �޿��� �ް� �̸��� u�� ���Ե� ����� ���� �μ����� �ٹ��ϴ�
-- ��� ����� ��� ��ȣ, �̸� �� �޿��� ǥ���Ͻÿ�.
select employee_id, last_name, salary
from employees
where salary > (select avg(salary)
                from employees)
and department_id in (select department_id
                    from employees
                    where last_name like '%u%');