-- Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!  (row n = 5).
SET SERVEROUTPUT ON;
DECLARE
  c_n   CONSTANT PLS_INTEGER := 5;
  v_out VARCHAR2(200);

  FUNCTION fact(p_n PLS_INTEGER) RETURN NUMBER IS
    f NUMBER := 1;
  BEGIN
    FOR i IN 2 .. p_n LOOP f := f * i; END LOOP;
    RETURN f;
  END;

  FUNCTION comb(p_n PLS_INTEGER, p_k PLS_INTEGER) RETURN NUMBER IS
  BEGIN
    RETURN fact(p_n) / (fact(p_k) * fact(p_n - p_k));
  END;
BEGIN
  FOR k IN 1 .. c_n LOOP
    v_out := v_out || (comb(c_n - 1, k - 1) * fact(c_n) / fact(k)) || ' ';
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(RTRIM(v_out));
END;
/
