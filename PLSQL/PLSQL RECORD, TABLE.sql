set serveroutput on

-- RECORD : 객체와 비슷?
declare
    -- 1) 정의
    type emp_record_type is record
    (empno number(6,0),
    ename employees.first_name%type,
    sal employees.salary%type := 0);
    -- 2) 변수 선언
    v_emp_info emp_record_type;
    v_emp_record emp_record_type;
begin
    select employee_id, first_name, salary
    into v_emp_info
    from employees
    where employee_id = &사원번호;
    
    DBMS_OUTPUT.PUT('사원번호 : ' || v_emp_info.empno);
    DBMS_OUTPUT.PUT(', 사원이름 : ' || v_emp_info.ename);
    DBMS_OUTPUT.PUT_LINE(', 급여 : ' || v_emp_info.sal);
end;
/

-- RECORD : %ROWTYPE
declare
    v_emp_info employees%rowtype;
begin
    select *
    into v_emp_info
    from employees
    where employee_id = &사원번호;
    
    DBMS_OUTPUT.PUT('사원번호 : ' || v_emp_info.employee_id);
    DBMS_OUTPUT.PUT(', 사원이름 : ' || v_emp_info.last_name);
    DBMS_OUTPUT.PUT_LINE(', 업무 : ' || v_emp_info.job_id);
end;
/

-- TABLE : 리스트?
declare
    -- 1) 정의
    type num_table_type is table of number
        index by pls_integer;
    -- 2) 변수 선언
    v_num_info num_table_type;
begin
    v_num_info(-1000) := 10000;
    
    DBMS_OUTPUT.PUT_LINE('현재 인덱스 -1000 : ' || v_num_info(-1000));
end;
/

-- 2의 배수 10개를 담는 예제 : 2, 4, 6, 8, 10, 12, 14, ...
DECLARE
    TYPE num_table_type IS TABLE OF NUMBER
        INDEX BY PLS_INTEGER;
        
    v_num_ary num_table_type;
    
    v_result NUMBER(4,0) := 0;
BEGIN
    FOR idx IN 1..10 LOOP
        v_num_ary(idx * 5) := idx * 2;
    END LOOP;
    
    FOR i IN v_num_ary.FIRST .. v_num_ary.LAST LOOP -- 해당테이블(리스트)의 첫 인덱스~ 마지막 인덱스 수색
        IF v_num_ary.EXISTS(i) THEN -- 존재하는 인덱스 찾기
            DBMS_OUTPUT.PUT(i || ' : ');
            DBMS_OUTPUT.PUT_LINE(v_num_ary(i));
            
            v_result := v_result + v_num_ary(i);
        END IF;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('총 갯수 : ' || v_num_ary.COUNT);
    DBMS_OUTPUT.PUT_LINE('누적합 : ' || v_result);
END;
/

-- TABLE + RECORD
SELECT *
FROM EMPLOYEES;

DECLARE
    TYPE emp_table_type IS TABLE OF employees%ROWTYPE
        INDEX BY PLS_INTEGER;
        
    v_emps emp_table_type;
    v_emp_info employees%ROWTYPE;
BEGIN
    FOR eid IN 100..104 LOOP
        SELECT *
        INTO v_emp_info
        FROM employees
        WHERE employee_id = eid;
        
        v_emps(eid) := v_emp_info;
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('총 갯수 : ' || v_emps.COUNT);
    DBMS_OUTPUT.PUT_LINE(v_emps(100).last_name);
END;
/
/*DECLARE
    TYPE emp_table_type IS TABLE OF employees%ROWTYPE
        INDEX BY PLS_INTEGER;
        
    v_emps emp_table_type;
    v_emp_info employees%ROWTYPE;
BEGIN
    FOR eid IN v_emps.first..v_emps.last LOOP
        SELECT *
        INTO v_emp_info
        FROM employees
        WHERE employees.EXISTS(eid) = eid;
        
        v_emps(eid) := v_emp_info;
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('총 갯수 : ' || v_emps.COUNT);
    DBMS_OUTPUT.PUT_LINE(v_emps(100).last_name);
END;
/
*/

DECLARE
    v_min employees.employee_id%TYPE; -- 최소 사원번호
    v_max employees.employee_id%TYPE; -- 최대 사원번호
    v_result NUMBER(1,0);             -- 사원의 존재유무를 확인
    v_emp_record employees%ROWTYPE;     -- Employees 테이블의 한 행에 대응
    
    TYPE emp_table_type IS TABLE OF v_emp_record%TYPE
        INDEX BY PLS_INTEGER;
    
    v_emp_table emp_table_type;
BEGIN
    -- 최소 사원번호, 최대 사원번호
    SELECT MIN(employee_id), MAX(employee_id)
    INTO v_min, v_max
    FROM employees;
    
    FOR eid IN v_min .. v_max LOOP
        SELECT COUNT(*)
        INTO v_result
        FROM employees
        WHERE employee_id = eid;
        
        IF v_result = 0 THEN
            CONTINUE;
        END IF;
        
        SELECT *
        INTO v_emp_record
        FROM employees
        WHERE employee_id = eid;
        
        v_emp_table(eid) := v_emp_record;     
    END LOOP;
    
    FOR eid IN v_emp_table.FIRST .. v_emp_table.LAST LOOP
        IF v_emp_table.EXISTS(eid) THEN
            DBMS_OUTPUT.PUT(v_emp_table(eid).employee_id || ', ');
            DBMS_OUTPUT.PUT(v_emp_table(eid).last_name || ', ');
            DBMS_OUTPUT.PUT_LINE(v_emp_table(eid).hire_date);
        END IF;
    END LOOP;    
END;
/