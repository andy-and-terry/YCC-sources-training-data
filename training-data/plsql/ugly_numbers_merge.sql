DECLARE
    TYPE t_seq IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    v_seq t_seq;
    i2 PLS_INTEGER := 1;
    i3 PLS_INTEGER := 1;
    i5 PLS_INTEGER := 1;
    c2 NUMBER; c3 NUMBER; c5 NUMBER; v_next NUMBER;
    v_line VARCHAR2(200);
BEGIN
    v_seq(1) := 1;
    FOR k IN 2 .. 12 LOOP
        c2 := v_seq(i2) * 2;
        c3 := v_seq(i3) * 3;
        c5 := v_seq(i5) * 5;
        v_next := LEAST(c2, c3, c5);
        v_seq(k) := v_next;
        IF v_next = c2 THEN i2 := i2 + 1; END IF;
        IF v_next = c3 THEN i3 := i3 + 1; END IF;
        IF v_next = c5 THEN i5 := i5 + 1; END IF;
    END LOOP;
    FOR k IN 1 .. 12 LOOP
        v_line := v_line || v_seq(k) || ' ';
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(v_line);
END;
/
