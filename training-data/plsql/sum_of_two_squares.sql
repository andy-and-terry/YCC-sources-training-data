-- Positive n expressible as a*a + b*b with a, b >= 0.
SET SERVEROUTPUT ON;
DECLARE
  v_out VARCHAR2(200);

  FUNCTION representable(p_n PLS_INTEGER) RETURN BOOLEAN IS
  BEGIN
    FOR a IN 0 .. p_n LOOP
      EXIT WHEN a * a > p_n;
      FOR b IN a .. p_n LOOP
        EXIT WHEN a * a + b * b > p_n;
        IF a * a + b * b = p_n THEN
          RETURN TRUE;
        END IF;
      END LOOP;
    END LOOP;
    RETURN FALSE;
  END;
BEGIN
  FOR n IN 1 .. 30 LOOP
    IF representable(n) THEN
      v_out := v_out || n || ' ';
    END IF;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(RTRIM(v_out));
END;
/
