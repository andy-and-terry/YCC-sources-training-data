-- Moser-de Bruijn sequence: binary digits of n read in base 4.
SET SERVEROUTPUT ON;
DECLARE
  v_out VARCHAR2(200);

  FUNCTION moser(p_n PLS_INTEGER) RETURN PLS_INTEGER IS
    v_n      PLS_INTEGER := p_n;
    v_result PLS_INTEGER := 0;
    v_place  PLS_INTEGER := 1;
  BEGIN
    WHILE v_n > 0 LOOP
      IF MOD(v_n, 2) = 1 THEN
        v_result := v_result + v_place;
      END IF;
      v_n := TRUNC(v_n / 2);
      v_place := v_place * 4;
    END LOOP;
    RETURN v_result;
  END;
BEGIN
  FOR n IN 0 .. 11 LOOP
    v_out := v_out || moser(n) || ' ';
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(v_out);
END;
/
