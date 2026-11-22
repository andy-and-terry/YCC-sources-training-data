-- Practical numbers: every m in 1..n is a sum of distinct divisors of n.
SET SERVEROUTPUT ON;
DECLARE
  TYPE t_flags IS TABLE OF BOOLEAN INDEX BY PLS_INTEGER;
  v_out VARCHAR2(200);

  FUNCTION is_practical(p_n PLS_INTEGER) RETURN BOOLEAN IS
    reach t_flags;
  BEGIN
    FOR i IN 0 .. p_n LOOP reach(i) := (i = 0); END LOOP;
    FOR d IN 1 .. p_n LOOP
      IF MOD(p_n, d) = 0 THEN
        FOR i IN REVERSE d .. p_n LOOP
          IF reach(i - d) THEN reach(i) := TRUE; END IF;
        END LOOP;
      END IF;
    END LOOP;
    FOR m IN 1 .. p_n LOOP
      IF NOT reach(m) THEN RETURN FALSE; END IF;
    END LOOP;
    RETURN TRUE;
  END;
BEGIN
  FOR n IN 1 .. 40 LOOP
    IF is_practical(n) THEN v_out := v_out || n || ' '; END IF;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(RTRIM(v_out));
END;
/
