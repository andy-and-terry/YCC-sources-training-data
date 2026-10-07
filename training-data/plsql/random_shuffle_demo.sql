CREATE OR REPLACE PROCEDURE random_shuffle_demo IS
    TYPE int_list IS TABLE OF PLS_INTEGER INDEX BY PLS_INTEGER;
    v_arr  int_list;
    v_j    PLS_INTEGER;
    v_tmp  PLS_INTEGER;
    v_out  VARCHAR2(100);
BEGIN
    DBMS_RANDOM.SEED(42);
    FOR i IN 1 .. 8 LOOP
        v_arr(i) := i;
    END LOOP;

    -- Fisher-Yates shuffle
    FOR i IN REVERSE 2 .. v_arr.COUNT LOOP
        v_j := TRUNC(DBMS_RANDOM.VALUE(1, i + 1));
        v_tmp := v_arr(i);
        v_arr(i) := v_arr(v_j);
        v_arr(v_j) := v_tmp;
    END LOOP;

    FOR i IN 1 .. v_arr.COUNT LOOP
        v_out := v_out || v_arr(i) || ' ';
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(RTRIM(v_out));
END random_shuffle_demo;
/
