CREATE OR REPLACE PROCEDURE continue_label_demo IS
BEGIN
    <<outer_loop>>
    FOR i IN 1 .. 4 LOOP
        FOR j IN 1 .. 4 LOOP
            CONTINUE outer_loop WHEN j > i;
            CONTINUE WHEN MOD(i + j, 2) = 1;
            DBMS_OUTPUT.PUT_LINE('i=' || i || ' j=' || j);
            EXIT outer_loop WHEN i * j >= 9;
        END LOOP;
    END LOOP outer_loop;
END continue_label_demo;
/
