SET SERVEROUTPUT ON;
DECLARE
  v_row VARCHAR2(100);
  FUNCTION fact(n PLS_INTEGER) RETURN NUMBER IS
    r NUMBER := 1;
  BEGIN
    FOR i IN 2 .. n LOOP r := r * i; END LOOP;
    RETURN r;
  END;
  FUNCTION lah(n PLS_INTEGER, k PLS_INTEGER) RETURN NUMBER IS
  BEGIN
    RETURN fact(n - 1) / (fact(k - 1) * fact(n - k)) * fact(n) / fact(k);
  END;
BEGIN
  FOR n IN 1 .. 5 LOOP
    v_row := NULL;
    FOR k IN 1 .. n LOOP v_row := v_row || lah(n, k) || ' '; END LOOP;
    DBMS_OUTPUT.PUT_LINE(v_row);
  END LOOP;
END;
/
