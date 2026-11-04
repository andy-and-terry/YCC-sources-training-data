CREATE OR REPLACE FUNCTION zigzag (p_s IN VARCHAR2, p_rows IN PLS_INTEGER) RETURN VARCHAR2 IS
    TYPE t_lines IS TABLE OF VARCHAR2(200) INDEX BY PLS_INTEGER;
    v_lines t_lines;
    v_r PLS_INTEGER := 1;
    v_step PLS_INTEGER := 1;
    v_out VARCHAR2(200);
BEGIN
    IF p_rows = 1 OR p_rows >= LENGTH(p_s) THEN RETURN p_s; END IF;
    FOR i IN 1 .. p_rows LOOP v_lines(i) := ''; END LOOP;
    FOR i IN 1 .. LENGTH(p_s) LOOP
        v_lines(v_r) := v_lines(v_r) || SUBSTR(p_s, i, 1);
        IF v_r = 1 THEN v_step := 1;
        ELSIF v_r = p_rows THEN v_step := -1;
        END IF;
        v_r := v_r + v_step;
    END LOOP;
    FOR i IN 1 .. p_rows LOOP v_out := v_out || v_lines(i); END LOOP;
    RETURN v_out;
END zigzag;
/
BEGIN DBMS_OUTPUT.PUT_LINE(zigzag('PAYPALISHIRING', 3)); END;
/
