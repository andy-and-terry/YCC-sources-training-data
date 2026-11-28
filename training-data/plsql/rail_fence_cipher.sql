SET SERVEROUTPUT ON;
DECLARE
  TYPE t_rows IS TABLE OF VARCHAR2(50) INDEX BY PLS_INTEGER;
  v_rows  t_rows;
  v_text  VARCHAR2(50) := 'WEAREDISCOVERED';
  v_rails PLS_INTEGER := 3;
  v_r     PLS_INTEGER := 1;
  v_step  PLS_INTEGER := 1;
  v_out   VARCHAR2(50);
BEGIN
  FOR i IN 1 .. v_rails LOOP v_rows(i) := NULL; END LOOP;
  FOR i IN 1 .. LENGTH(v_text) LOOP
    v_rows(v_r) := v_rows(v_r) || SUBSTR(v_text, i, 1);
    IF v_r = 1 THEN v_step := 1; ELSIF v_r = v_rails THEN v_step := -1; END IF;
    v_r := v_r + v_step;
  END LOOP;
  FOR i IN 1 .. v_rails LOOP v_out := v_out || v_rows(i); END LOOP;
  DBMS_OUTPUT.PUT_LINE(v_out);
END;
/
