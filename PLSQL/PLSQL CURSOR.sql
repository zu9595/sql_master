set serveroutput on

-- CURSOR : SELECT로 가져온 다중 행을 하나씩 읽어 들임
-- FETCH시 항상 1행부터 마지막 행까지 순차적으로 포인터가 이동
-- 기본적으로 행을 가리키는 포인터가 상주하고 있으므로 마지막 값이 여러번 읽어질 수 있으니 주의
DECLARE
    -- 커서를 선언
    CURSOR emp_cursor IS
        SELECT employee_id, last_name 
        FROM employees;
        -- WHERE employee_id = 0; --데이터가 없어도 오류가 생기지 않으므로 주의
        
    -- 커서에서 들고온 컬럼수만큼 정의
    v_eid employees.employee_id%TYPE;
    v_ename employees.last_name%TYPE;
BEGIN
    OPEN emp_cursor;
    
    FETCH emp_cursor INTO v_eid, v_ename; -- 첫 행부터 커서에서 들고온 컬럼들을 일단 변수에 저장
    
    DBMS_OUTPUT.PUT_LINE('사원번호 : ' || v_eid);
    DBMS_OUTPUT.PUT_LINE('사원이름 : ' || v_ename);

    CLOSE emp_cursor;    
END;
/

DECLARE
    CURSOR emp_cursor IS
        SELECT employee_id, last_name, job_id
        FROM employees;
        
    v_emp_record emp_cursor%ROWTYPE; -- 행 객체타입
BEGIN
    OPEN emp_cursor;
    LOOP
        FETCH emp_cursor INTO v_emp_record;
        EXIT WHEN emp_cursor%NOTFOUND; -- 새로운 데이터가 더 이상 없을 경우 TRUE값. 종료.
        DBMS_OUTPUT.PUT(emp_cursor%ROWCOUNT || ', ');
        DBMS_OUTPUT.PUT_LINE(v_emp_record.last_name);
    END LOOP;
    CLOSE emp_cursor;
END;
/

DECLARE
    CURSOR emp_cursor IS
        SELECT *
        FROM employees;
    
    v_emp_record employees%ROWTYPE;
    
    TYPE emp_table_type IS TABLE OF employees%ROWTYPE
        INDEX BY PLS_INTEGER;
        
    v_emp_table emp_table_type;
BEGIN
    OPEN emp_cursor;
    
    LOOP
        FETCH emp_cursor INTO v_emp_record;
        EXIT WHEN emp_cursor%NOTFOUND;
        
        v_emp_table(v_emp_record.employee_id) := v_emp_record;
    END LOOP;
    
    CLOSE emp_cursor;
    
    FOR eid IN v_emp_table.FIRST..v_emp_table.LAST LOOP
        IF v_emp_table.EXISTS(eid) THEN
            DBMS_OUTPUT.PUT(v_emp_table(eid).employee_id || ', ');
            DBMS_OUTPUT.PUT(v_emp_table(eid).last_name || ', ');
            DBMS_OUTPUT.PUT_line(v_emp_table(eid).hire_date);
        END IF;
    END LOOP;
END;
/

--
DECLARE
    CURSOR emp_dept_cursor IS
        SELECT employee_id, last_name, job_id
        FROM employees
        WHERE department_id = &부서번호;
        
    v_emp_info emp_dept_cursor%ROWTYPE;
BEGIN
    -- 1) 해당 부서에 속한 사원의 정보를 출력
    -- 2) 해당 부서에 속한 사원이 없는 경우 '해당 부서에 소속된 직원이 없습니다.'라는 메세지 출력
    OPEN emp_dept_cursor;
    
    LOOP
        FETCH emp_dept_cursor INTO v_emp_info;
        EXIT WHEN emp_dept_cursor%NOTFOUND;
        dbms_output.put_line(emp_dept_cursor%ROWCOUNT);
        dbms_output.put(v_emp_info.employee_id || ', ');
        dbms_output.put(v_emp_info.last_name || ', ');
        dbms_output.put_line(v_emp_info.job_id);
    END LOOP;
    dbms_output.put_line('읽고 난 후 ' || emp_dept_cursor%ROWCOUNT);
    IF emp_dept_cursor%ROWCOUNT = 0 THEN
        dbms_output.put_line('해당 부서에 소속된 직원이 없습니다.');
    END IF;
    CLOSE emp_dept_cursor;
END;
/

-- 1) 모든 사원의 사원번호, 이름, 부서이름 출력
DECLARE
    CURSOR emp_cursor is
        select employee_id, last_name, department_name
        from employees e
        left outer join departments d
        on(e.department_id = d.department_id);
        
    v_einfo emp_cursor%rowtype;
BEGIN
    open emp_cursor;
    loop
        fetch emp_cursor into v_einfo;
        exit when emp_cursor%notfound;

        DBMS_OUTPUT.PUT(v_einfo.employee_id || ', ');
        DBMS_OUTPUT.PUT(v_einfo.last_name || ', ');
        DBMS_OUTPUT.PUT_line(v_einfo.department_name);    
    end loop;
    close emp_cursor;
END;
/

-- 2) 부서번호가 50이거나 80인 사원들의 사원이름, 급여, 연봉 출력
DECLARE
    cursor emp_cursor is
        select last_name, salary, commission_pct
        from employees
        where department_id IN(50, 80);
        
    v_einfo emp_cursor%rowtype;
    v_ysal number(10, 0);
BEGIN
    open emp_cursor;
    loop
        fetch emp_cursor into v_einfo;
        exit when emp_cursor%notfound;
        
        v_ysal := (v_einfo.salary*12) + (nvl(v_einfo.salary, 0) * nvl(v_einfo.commission_pct, 0) * 12);
        DBMS_OUTPUT.PUT(v_einfo.last_name || ', ');
        DBMS_OUTPUT.PUT(v_einfo.salary || ', ');
        DBMS_OUTPUT.PUT_line(v_ysal);
    end loop;
    close emp_cursor;
END;
/