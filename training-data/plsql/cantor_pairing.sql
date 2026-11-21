-- Cantor pairing function and its inverse.
SET SERVEROUTPUT ON;
DECLARE
  v_x PLS_INTEGER;
  v_y PLS_INTEGER;

  FUNCTION pair(p_x PLS_INTEGER, p_y PLS_INTEGER) RETURN PLS_INTEGER IS
  BEGIN
    RETURN (p_x + p_y) * (p_x + p_y + 1) / 2 + p_y;
  END;

  PROCEDURE unpair(p_z PLS_INTEGER, p_x OUT PLS_INTEGER, p_y OUT PLS_INTEGER) IS
    v_w PLS_INTEGER := FLOOR((FLOOR(SQRT(8 * p_z + 1)) - 1) / 2);
  BEGIN
    p_y := p_z - v_w * (v_w + 1) / 2;
    p_x := v_w - p_y;
  END;
BEGIN
  DBMS_OUTPUT.PUT_LINE(pair(3, 4));
  unpair(32, v_x, v_y);
  DBMS_OUTPUT.PUT_LINE(v_x || ' ' || v_y);
END;
/
