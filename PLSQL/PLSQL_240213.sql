set serveroutput on

begin
    dbms_output.put_line('hello, world!');
end;
/ 
-- /: �ش� ���� �������ϴ� ��ɾ�



declare
    -- ����� : ���� �� ����
    v_annual number(9,2) := '&����'; -- &ġȯ����, NUMBER(�ڸ���,�Ҽ�����[0�̸� ����])
    v_sal v_annual%type;
begin
    -- �����
    v_sal := v_annual/12;
    DBMS_OUTPUT.PUT_LINE('The monthly salary is ' || to_char(v_sal));
end;
/
-- to_char�� ��ȯ �Լ��� ���ɿ� ������ �ִ� �����ϸ� ������� �� ��



-- ���� ���� ����
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
        v_message := 'CLERK not ' || v_message; -- �ٱ� ������ �����ͼ� �����ϹǷ� ������ ��
        v_comm := v_sal * .30; -- ���Ǳ��� ��ġ�� �Ʒ�
    END;
    DBMS_OUTPUT.PUT_LINE('v_sal ' || v_sal); -- 60000
    DBMS_OUTPUT.PUT_LINE('v_comm ' || v_comm); -- 12000
    DBMS_OUTPUT.PUT_LINE('v_message ' || v_message); -- 'CLERK not  eligible for commission'
    DBMS_OUTPUT.PUT_LINE('================================');
    v_message := 'SALESMAN ' || v_message;
    DBMS_OUTPUT.PUT_LINE('v_message ' || v_message); -- 'SALESMAN CLERK not  eligible for commission'
END;
/
-- PL/SQL�� SEL, DML, TCL�� ����, DDL, DCL�� ������� ����



declare
    v_eid employees.employee_id%type;
    v_ename varchar2(100);
begin
    select employee_id, last_name
    into v_eid, v_ename -- PL/SQL���� INTO���� ������ ����ִ� ��, SELECT���� ��ȸ�� �÷��� ���� 1�� �Ҵ�, �ݵ�� �ϳ��� �ุ ��ȯ (�ʼ�)
    from employees
    where employee_id = &�����ȣ;
    
    DBMS_OUTPUT.PUT_LINE('�����ȣ : ' || v_eid);
    DBMS_OUTPUT.PUT_LINE('����̸� : ' || v_ename);
end;
/
-- DML : �Ͻ��� Ŀ���� ����ؼ� üũ : SQL%ROWCOUNT ���� �ֱ��� SQL ���� ����� ���� ����(���� ��)
