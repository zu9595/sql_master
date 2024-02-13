set serveroutput on

begin
    dbms_output.put_line('hello, world!');
end;
/ 
-- /: 해당 블럭을 컴파일하는 명령어



declare
    -- 선언부 : 정의 및 선언
    v_annual number(9,2) := '&연봉'; -- &치환변수, NUMBER(자릿수,소수점수[0이면 무시])
    v_sal v_annual%type;
begin
    -- 실행부
    v_sal := v_annual/12;
    DBMS_OUTPUT.PUT_LINE('The monthly salary is ' || to_char(v_sal));
end;
/
-- to_char등 변환 함수는 성능에 영향을 주니 웬만하면 사용하지 말 것



-- 변수 적용 범위
DECLARE
    v_sal NUMBER(7,2) := 60000;
    v_comm v_sal%TYPE := v_sal * .20;
    v_message VARCHAR2(255) := ' eligible for commission';
BEGIN
    DBMS_OUTPUT.PUT_LINE('v_sal ' || v_sal); -- 60000
    DBMS_OUTPUT.PUT_LINE('v_comm ' || v_comm); -- 12000
    DBMS_OUTPUT.PUT_LINE('v_message ' || v_message); -- ' eligible for commission'
    DBMS_OUTPUT.PUT_LINE('================================');
    DECLARE 
        v_sal NUMBER(7,2) := 50000;
        v_comm v_sal%TYPE := 0;
        v_total_comp NUMBER(7,2) := v_sal + v_comm;
    BEGIN
        DBMS_OUTPUT.PUT_LINE('v_sal ' || v_sal); -- 50000
        DBMS_OUTPUT.PUT_LINE('v_comm ' || v_comm); -- 0
        DBMS_OUTPUT.PUT_LINE('v_message ' || v_message); -- ' eligible for commission'
        DBMS_OUTPUT.PUT_LINE('v_total_comp ' || v_total_comp); -- 50000
        DBMS_OUTPUT.PUT_LINE('================================');
        v_message := 'CLERK not ' || v_message; -- 바깥 변수를 가져와서 변경하므로 적용은 됨
        v_comm := v_sal * .30; -- 정의구문 위치가 아래
    END;
    DBMS_OUTPUT.PUT_LINE('v_sal ' || v_sal); -- 60000
    DBMS_OUTPUT.PUT_LINE('v_comm ' || v_comm); -- 12000
    DBMS_OUTPUT.PUT_LINE('v_message ' || v_message); -- 'CLERK not  eligible for commission'
    DBMS_OUTPUT.PUT_LINE('================================');
    v_message := 'SALESMAN ' || v_message;
    DBMS_OUTPUT.PUT_LINE('v_message ' || v_message); -- 'SALESMAN CLERK not  eligible for commission'
END;
/
-- PL/SQL은 SEL, DML, TCL만 가능, DDL, DCL은 사용하지 말것



declare
    v_eid employees.employee_id%type;
    v_ename varchar2(100);
begin
    select employee_id, last_name
    into v_eid, v_ename -- PL/SQL에서 INTO절은 변수에 집어넣는 것, SELECT절로 조회한 컬럼당 변수 1개 할당, 반드시 하나의 행만 반환 (필수)
    from employees
    where employee_id = &사원번호;
    
    DBMS_OUTPUT.PUT_LINE('사원번호 : ' || v_eid);
    DBMS_OUTPUT.PUT_LINE('사원이름 : ' || v_ename);
end;
/
-- DML : 암시적 커서를 사용해서 체크 : SQL%ROWCOUNT 가장 최근의 SQL 문이 적용된 행의 개수(정수 값)
