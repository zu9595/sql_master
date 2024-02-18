-- 1) 오라클이 관리하고 있고 이름이 존재하는 경우

DECLARE
    v_ename employees.last_name%TYPE;
BEGIN
    -- 변수에 단일값 아닌 다중값 입력 => TOO_MANY_ROWS 에러
    SELECT last_name
    INTO   v_ename
    FROM   employees
    WHERE  department_id = &부서번호;
    
    DBMS_OUTPUT.PUT_LINE(v_ename);
EXCEPTION
    -- ※ 예외처리는 하나만 동작함
    -- WHEN ~ THEN : 해당 에러 이름
    -- 하나의 when당 하나의 에러 종류만 처리
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('해당 부서에는 여러 명의 사원이 존재합니다.');
        
    -- NO_DATA_FOUND 에러 처리
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('해당 부서에는 근무하는 사원이 존재하지 않습니다.');

    -- 기타 에러 처리(OTHERS)
    -- OTHERS에 모든 에러 맡기면 안됨 => 어떤 에러 나는지 구분하고 개선할 필요
    -- 알고있는 선까지는 예외 개별처리 / 진짜 에러나면 안되는 상황에서 OTHERS
    WHEN OTHERS THEN -- 다음 WHEN절 실행전까지 적용, 없으면 끝까지
        DBMS_OUTPUT.PUT_LINE('기타 예외가 발생했습니다.');
        DBMS_OUTPUT.PUT_LINE('EXCEPTION절이 실행되었습니다.');
END;
/

-- 2) 오라클이 관리하고 있고 이름이 존재하지 않는 경우
DECLARE
    e_emps_remaining EXCEPTION;
    PRAGMA EXCEPTION_INIT(e_emps_remaining, -02292);
BEGIN
    DELETE FROM departments
    WHERE department_id = &부서번호;
    
EXCEPTION
    WHEN e_emps_remaining THEN
        DBMS_OUTPUT.PUT_LINE('다른 테이블에서 사용하고 있습니다.');
END;
/

-- 3) 사용자가 정의하는 예외사항
DECLARE
    e_emp_del_fail EXCEPTION;
BEGIN
    DELETE FROM test_employees
    WHERE employee_id = &사원번호;
    
    IF SQL%ROWCOUNT = 0 THEN
        RAISE e_emp_del_fail;
    END IF;
EXCEPTION
    WHEN e_emp_del_fail THEN
        DBMS_OUTPUT.PUT_LINE('해당 사원이 존재하지 않습니다.');
END;
/

-- 예외 트랩 함수(SQLCODE, SQLERM)
DECLARE
    e_too_many EXCEPTION; -- 사용자 정의 에러 변수
    
    v_ex_code NUMBER;
    v_ex_msg VARCHAR2(1000);
    emp_info employees%ROWTYPE;
BEGIN
    SELECT *
    INTO emp_info
    FROM employees
    WHERE department_id = &부서번호;
    
    IF emp_info.salary < (emp_info.salary * emp_info.commission_pct + 10000) THEN -- 오라클 에러를 발생시킬 조건문
        RAISE e_too_many; -- RAISE : 오라클에서 사용자 정의 에러를 인식하고 띄워줌
    END IF;
EXCEPTION
    WHEN e_too_many THEN
        DBMS_OUTPUT.PUT_LINE('사용자 정의 예외 발생!');
    WHEN OTHERS THEN
        v_ex_code := SQLCODE;
        v_ex_msg := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('ORA ' || v_ex_code);
        DBMS_OUTPUT.PUT_LINE(' - ' || v_ex_msg);
END;
/
-- 1) test employees 테이블을 사용하여 선택된 사원을 삭제하는 PL/SQL작성
-- 조건1) 치환변수 사용
-- 조건2) 사원이 존재하지 않는 경우 '해당 사원이 존재하지 않습니다.'라는 메세지를 출력
-- => 사용자 정의 예외 사용

DECLARE
    e_empdel EXCEPTION;
    
BEGIN
    DELETE test_employees
    WHERE  employee_id = &사원번호;
    
    IF SQL%ROWCOUNT = 0 THEN
        RAISE e_empdel;
    END IF;
    
EXCEPTION
    WHEN e_empdel THEN
        DBMS_OUTPUT.PUT_LINE('해당 사원이 존재하지 않습니다.');
END;
/
