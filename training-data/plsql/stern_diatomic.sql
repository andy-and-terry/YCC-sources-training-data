DECLARE
    TYPE num_tab IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    seq num_tab;
    v_h PLS_INTEGER;
    v_out VARCHAR2(200);
BEGIN
    seq(0) := 0;
    seq(1) := 1;
    FOR i IN 2..14 LOOP
        v_h := TRUNC(i / 2);
        IF MOD(i, 2) = 0 THEN
            seq(i) := seq(v_h);
        ELSE
            seq(i) := seq(v_h) + seq(v_h + 1);
        END IF;
    END LOOP;
    FOR i IN 0..14 LOOP
        v_out := v_out || seq(i) || ' ';
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(v_out); -- 0 1 1 2 1 3 2 3 1 4 3 5 2 5 3
END;
/
