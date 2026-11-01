-- n is triangular iff 8n + 1 is a perfect square.
SET SERVEROUTPUT ON;
DECLARE
  v_out VARCHAR2(200);
  v_s   PLS_INTEGER;
  v_r   PLS_INTEGER;
BEGIN
  FOR n IN 0 .. 20 LOOP
    v_s := 8 * n + 1;
    v_r := ROUND(SQRT(v_s));
    IF v_r * v_r = v_s THEN
      v_out := v_out || n || ' ';
    END IF;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(RTRIM(v_out));
END;
/
