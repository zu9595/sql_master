-- PROCEDURE : 프로시저 쪽에 등록, 수정불가(DROP이나 OR REPLACE 사용)
CREATE PROCEDURE test_pro
IS
-- 선언부 : 내부에서 사용하는 변수, 커서, 타입, 예외
    v_msg VARCHAR2(1000) := 'Execute Procedure';
BEGIN
    DELETE FROM test_employees
    WHERE department_id = 50;
    
    DBMS_OUTPUT.PUT_LINE(v_msg);
EXCEPTION
    WHEN INVALID_CURSOR THEN
        DBMS_OUTPUT.PUT_LINE('사용할 수 없는 커서입니다.');
END;
/

-- 실행1)
BEGIN
    test_pro; -- 변수가 없으면 프로시저로 인식
END;
/
-- 실행2)
EXECUTE test_pro; -- 단축 명령어

-- IN : PROCEDURE 내부에서 상수로 인식
DROP PROCEDURE raise_salary;

CREATE PROCEDURE raise_salary
(p_eid IN employees. employee_id%TYPE)
IS

BEGIN
    UPDATE employees
    SET salary = salary * 1.1
    WHERE employee_id = p_eid;
END;
/

DECLARE
    v_first NUMBER(3,0) := 100;
    v_second CONSTANT NUMBER(3,0) := 149;
BEGIN
    raise_salary(103);
    raise_salary((v_first+10));
    raise_salary(v_second);
    raise_salary(v_first);
END;
/
SELECT employee_id, salary
from employees;

-- OUT : PROCEDURE 내부에서 초기화되지 않은 변수
CREATE PROCEDURE test_p_out
(p_num IN NUMBER,
 p_result OUT NUMBER)
IS
    v_sum NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('IN : ' || p_num);
    DBMS_OUTPUT.PUT_LINE('OUT : ' || p_result);
    -- p_result := 10;
    v_sum := p_num + p_result;
    p_result := v_sum;
END;
/

DECLARE
    v_result NUMBER(4,0) := 1234;
BEGIN
    DBMS_OUTPUT.PUT_LINE('1) result : ' || v_result);
    test_p_out(1000, v_result);
    DBMS_OUTPUT.PUT_LINE('2) result : ' || v_result);
END;
/

CREATE PROCEDURE select_emp
(p_eid in employees.employee_id%TYPE,
 p_ename OUT employees.last_name%type,
 p_sal OUT employees.salary%type,
 p_comm OUT employees.commission_pct%type)
IS

BEGIN
    SELECT last_name, salary, nvl(commission_pct,0)
    INTO p_ename, p_sal, p_comm
    from employees
    where employee_id = p_eid;
end;
/

declare
    v_name varchar2(100 char);
    v_sal number;
    v_comm number;
    
    v_eid number := &사원번호;
begin
    select_emp(v_eid, v_name, v_sal, v_comm);
    
    DBMS_OUTPUT.PUT('사원번호 : ' || v_eid);
    DBMS_OUTPUT.PUT(', 사원이름 : ' || v_name);
    DBMS_OUTPUT.PUT(', 급여 : ' || v_sal);
    DBMS_OUTPUT.PUT(', 커미션 : ' || v_comm);
end;
/

-- IN OUT 매개변수
-- '01012341234' => '010-1234-1234'
CREATE PROCEDURE format_phone
(p_phone_no in out varchar2)
is

BEGIN
    p_phone_no := substr(p_phone_no, 1, 3)
                || '-' || substr(p_phone_no, 4, 4)
                || '-' || substr(p_phone_no, 8);
END;
/

declare
    v_ph_no varchar2(100) := '01012341234';
begin
    DBMS_OUTPUT.PUT_LINE('1) ' || v_ph_no);
    format_phone(v_ph_no);
    DBMS_OUTPUT.PUT_LINE('2) ' || v_ph_no);
END;
/

create table var_pk_tbl
(
    no varchar2(1000) primary key,
    name varchar2(4000) default 'anony'
);
select no, name
from var_pk_tbl;
'TEMP240215001' -- TEMP + yyMMdd + 숫자(3자리)

SELECT NVL(MAX(employee_id),0) + 1
from employees;

select 'TEMP' || to_char(240215, 'yyMMdd') || lpad(nvl(max(substr(no, -3)),0) +1,3,'0')
from var_pk_tbl;
--where substr(no, 5, 6) = to_char(240215, 'yyMMdd')

/*
1.
주민등록번호를 입력하면 
다음과 같이 출력되도록 yedam_ju 프로시저를 작성하시오.

EXECUTE yedam_ju(9501011667777)
EXECUTE yedam_ju(1511013689977)

  -> 950101-1******
*/

create or replace procedure yedam_ju
(p_num in varchar2)
is
    v_result varchar2(100);
BEGIN
    v_result := substr(p_num, 1, 6)
                || '-' || rpad(substr(p_num, 7, 1), 7, '*');
    DBMS_output.put_line(v_result);
END;
/

EXECUTE yedam_ju(9501011667777);
EXECUTE yedam_ju(1511013687777);

/*
2.
사원번호를 입력할 경우
삭제하는 TEST_PRO 프로시저를 생성하시오.
단, 해당사원이 없는 경우 "해당사원이 없습니다." 출력
예) EXECUTE TEST_PRO(176)
*/

/*
3.
다음과 같이 PL/SQL 블록을 실행할 경우 
사원번호를 입력할 경우 사원의 이름(last_name)의 첫번째 글자를 제외하고는
'*'가 출력되도록 yedam_emp 프로시저를 생성하시오.

실행) EXECUTE yedam_emp(176)
실행결과) TAYLOR -> T*****  <- 이름 크기만큼 별표(*) 출력
*/

/*
4.
부서번호를 입력할 경우 
해당부서에 근무하는 사원의 사원번호, 사원이름(last_name)을 출력하는 get_emp 프로시저를 생성하시오. 
(cursor 사용해야 함)
단, 사원이 없을 경우 "해당 부서에는 사원이 없습니다."라고 출력(exception 사용)
실행) EXECUTE get_emp(30)
*/

/*
5.
직원들의 사번, 급여 증가치만 입력하면 Employees테이블에 쉽게 사원의 급여를 갱신할 수 있는 y_update 프로시저를 작성하세요. 
만약 입력한 사원이 없는 경우에는 ‘No search employee!!’라는 메시지를 출력하세요.(예외처리)
실행) EXECUTE y_update(200, 10)
*/