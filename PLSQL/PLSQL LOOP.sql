
-- 기본 LOOP문
declare
    v_num number(38) := 0;
begin
    loop
        v_num := v_num + 1;
        DBMS_OUTPUT.PUT_LINE(v_num);
        exit when v_num > 10; -- 종료 조건
    end loop;
end;
/

-- WHILE LOOP문
declare
    v_num number(38,0) := 1;
begin
    while v_num <= 5 loop -- 반복조건
        DBMS_OUTPUT.PUT_LINE(v_num);
        v_num := v_num + 1;
    end loop;
end;
/

-- 예제 : 1에서 10까지 정수값의 합
-- 1) 기본 loop
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
    while v_num <= 10 loop -- 반복조건
        v_sum := v_sum + v_num;
        v_num := v_num + 1;
    end loop;
    DBMS_OUTPUT.PUT_LINE(v_sum);
end;
/

-- FOR LOOP
begin
    for idx in reverse -10..5 loop -- reverse : 최대값부터 읽어옴, (-10/5)..(4/2)와 같이 연산도 가능
        if mod(idx, 2) <> 0 then -- mod : 나머지 연산자, <> : PLSQL에선 !=대신 사용
            DBMS_OUTPUT.PUT_LINE(idx);
        end if;
    end loop;
end;
/

-- 주의사항 2) 카운터(counter)
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

-- 예제 : 1에서 10까지 정수값의 합
-- 3) FOR LOOP
declare
    -- 정수값 : 1 ~ 10 => FOR LOOP의 카운터로 처리
    -- 합계
    v_total number(2, 0) := 0;
begin
    for i in 1..10 loop
        v_total := v_total + i;
    end loop;
    DBMS_OUTPUT.PUT_LINE(v_total);
end;
/

/*
1. 다음과 같이 출력되도록 하시오. -- loop문 각각으로 실행
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
2. 치환변수(&)를 사용하면 숫자를 입력하면
해당 구구단이 출력되도록 하시오.
예) 2 입력시
2 * 1 = 2
2 * 2 = 4
2 * 3 = 6
...
2 * 9 = 18 
*/
declare
    v_def number(10) := &단수;
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
    v_def number(10) := &단수;
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
    v_def number(10) := &단수;
    v_result number(10) := 0;
begin
    for idx in 1..9 loop
        v_result := v_def * idx;
        DBMS_OUTPUT.PUT_line(v_def || ' * ' || idx || ' = ' || v_result);
    end loop;
end;
/

/*
3. 구구단 2~9단까지 출력되도록 하시오
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
4. 구구단 1~9단까지 출력되도록 하시오.
    (단 홀수단 출력)
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
