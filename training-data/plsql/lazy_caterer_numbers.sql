-- Lazy caterer's sequence: max pieces from n straight cuts, n(n+1)/2 + 1.
SET SERVEROUTPUT ON;
DECLARE
  v_out VARCHAR2(200);
BEGIN
  FOR n IN 0 .. 9 LOOP
    v_out := v_out || (n * (n + 1) / 2 + 1) || ' ';
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(RTRIM(v_out));
END;
/
