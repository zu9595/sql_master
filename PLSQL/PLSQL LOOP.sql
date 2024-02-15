
-- �⺻ LOOP��
declare
    v_num number(38) := 0;
begin
    loop
        v_num := v_num + 1;
        DBMS_OUTPUT.PUT_LINE(v_num);
        exit when v_num > 10; -- ���� ����
    end loop;
end;
/

-- WHILE LOOP��
declare
    v_num number(38,0) := 1;
begin
    while v_num <= 5 loop -- �ݺ�����
        DBMS_OUTPUT.PUT_LINE(v_num);
        v_num := v_num + 1;
    end loop;
end;
/

-- ���� : 1���� 10���� �������� ��
-- 1) �⺻ loop
declare
    v_sum number(38,0) := 0;
    v_num number(38,0) := 1;
begin
    loop
        v_sum := v_sum + v_num;
        v_num := v_num + 1;
        exit when v_num > 10;
    end loop;
    DBMS_OUTPUT.PUT_LINE(v_sum);
end;
/
-- 2) while loop
declare
    v_sum number(38,0) := 0;
    v_num number(38,0) := 1;
begin
    while v_num <= 10 loop -- �ݺ�����
        v_sum := v_sum + v_num;
        v_num := v_num + 1;
    end loop;
    DBMS_OUTPUT.PUT_LINE(v_sum);
end;
/

-- FOR LOOP
begin
    for idx in reverse -10..5 loop -- reverse : �ִ밪���� �о��, (-10/5)..(4/2)�� ���� ���굵 ����
        if mod(idx, 2) <> 0 then -- mod : ������ ������, <> : PLSQL���� !=��� ���
            DBMS_OUTPUT.PUT_LINE(idx);
        end if;
    end loop;
end;
/

-- ���ǻ��� 2) ī����(counter)
declare
    v_num number(2,0) := 0;
begin
    DBMS_OUTPUT.PUT_LINE(v_num);
    v_num := v_num * 2;
    DBMS_OUTPUT.PUT_LINE(v_num);
    DBMS_OUTPUT.PUT_LINE('==============================');
    for v_num in 1..10 loop
        -- v_num := v_num * 2; x
        dbms_output.put_line(v_num);
    end loop;
    dbms_output.put_line(v_num);
end;
/

-- ���� : 1���� 10���� �������� ��
-- 3) FOR LOOP
declare
    -- ������ : 1 ~ 10 => FOR LOOP�� ī���ͷ� ó��
    -- �հ�
    v_total number(2, 0) := 0;
begin
    for i in 1..10 loop
        v_total := v_total + i;
    end loop;
    DBMS_OUTPUT.PUT_LINE(v_total);
end;
/

/*
1. ������ ���� ��µǵ��� �Ͻÿ�. -- loop�� �������� ����
*
**
***
****
*****

*/

declare
    v_stars varchar2(10);
    v_idx number(38,0) := 0;
begin
    loop
        v_idx := v_idx + 1;
        v_stars := v_stars || '*';
        DBMS_OUTPUT.PUT_LINE(v_stars);
        exit when v_idx >= 5;
    end loop;
end;
/

declare
    v_idx number(38,0) := 0;
    v_stars varchar2(10);
begin
    while v_idx < 5 loop
        v_idx := v_idx + 1;
        v_stars := v_stars || '*';
        DBMS_OUTPUT.PUT_LINE(v_stars);
    end loop;
end;
/

declare
    v_stars varchar2(10);
begin
    for i in 1..5 loop
        v_stars := v_stars || '*';
        DBMS_OUTPUT.PUT_LINE(v_stars);
    end loop;
end;
/

/*
2. ġȯ����(&)�� ����ϸ� ���ڸ� �Է��ϸ�
�ش� �������� ��µǵ��� �Ͻÿ�.
��) 2 �Է½�
2 * 1 = 2
2 * 2 = 4
2 * 3 = 6
...
2 * 9 = 18 
*/
declare
    v_def number(10) := &�ܼ�;
    v_idx number(10) := 0;
    v_result number(10) := 0;
begin
    loop
        v_idx := v_idx + 1;
        v_result := v_def * v_idx;
        DBMS_OUTPUT.PUT_line(v_def || ' * ' || v_idx || ' = ' || v_result);
        exit when v_idx >= 9;
    end loop;
end;
/

declare
    v_def number(10) := &�ܼ�;
    v_idx number(10) := 0;
    v_result number(10) := 0;
begin
    while v_idx < 9 loop
        v_idx := v_idx + 1;
        v_result := v_def * v_idx;
        DBMS_OUTPUT.PUT_line(v_def || ' * ' || v_idx || ' = ' || v_result);
    end loop;
end;
/

declare
    v_def number(10) := &�ܼ�;
    v_result number(10) := 0;
begin
    for idx in 1..9 loop
        v_result := v_def * idx;
        DBMS_OUTPUT.PUT_line(v_def || ' * ' || idx || ' = ' || v_result);
    end loop;
end;
/

/*
3. ������ 2~9�ܱ��� ��µǵ��� �Ͻÿ�
*/
declare
    v_idx_x number(38) := 1;
    v_idx_y number(38);
begin
    loop
        v_idx_x := v_idx_x + 1;
        v_idx_y := 0;
        loop
            v_idx_y := v_idx_y + 1;
            DBMS_OUTPUT.PUT_LINE(v_idx_x || ' * ' || v_idx_y || ' = ' || v_idx_x * v_idx_y);
            exit when v_idx_y >= 9;
        end loop;
        exit when v_idx_x >= 9;
    end loop;  
end;
/

declare
    v_idx_x number(38) := 1;
    v_idx_y number(38);
begin
    while v_idx_x < 9 loop
        v_idx_x := v_idx_x + 1;
        v_idx_y := 0;
        while v_idx_y < 9 loop
            v_idx_y := v_idx_y + 1;
            DBMS_OUTPUT.PUT_LINE(v_idx_x || ' * ' || v_idx_y || ' = ' || v_idx_x * v_idx_y);
        end loop;
    end loop;
end;
/

begin
    for x in 2..9 loop
        for y in 1..9 loop
        DBMS_OUTPUT.PUT_LINE(x || ' * ' || y || ' = ' || x * y);
        end loop;
    end loop;
end;
/

begin
    for x in 1..9 loop
        for y in 2..9 loop
        DBMS_OUTPUT.PUT(y || ' * ' || x || ' = ' || x * y || chr(9));
        end loop;
        DBMS_OUTPUT.PUT_LINE('');
    end loop;
end;
/

declare
    v_idx_x number(10) := 0;
    v_idx_y number(10);
begin
    while v_idx_x < 9 loop
        v_idx_x := v_idx_x + 1;
        v_idx_y := 1;
        while v_idx_y < 9 loop
            v_idx_y := v_idx_y + 1;
            DBMS_OUTPUT.PUT(v_idx_y || ' * ' || v_idx_x || ' = ' || v_idx_x * v_idx_y || chr(9));
        end loop;
        DBMS_OUTPUT.PUT_LINE('');
    end loop;
end;
/

/*
4. ������ 1~9�ܱ��� ��µǵ��� �Ͻÿ�.
    (�� Ȧ���� ���)
*/
declare
    v_idx_x number(10) := 0;
    v_idx_y number(10);
begin
    loop
        v_idx_x := v_idx_x + 1;
        v_idx_y := 0;
        if mod(v_idx_x, 2) <> 0 then
            loop
                v_idx_y := v_idx_y + 1;
                DBMS_OUTPUT.PUT_LINE(v_idx_x || ' * ' || v_idx_y || ' = ' || v_idx_x * v_idx_y);
                exit when v_idx_y >= 9;
            end loop;
        end if;
        exit when v_idx_x >= 9;
    end loop;
end;
/
