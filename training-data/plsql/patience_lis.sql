DECLARE
  TYPE num_tab IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
  a num_tab; tails num_tab; len PLS_INTEGER := 0; lo PLS_INTEGER; hi PLS_INTEGER; mid PLS_INTEGER;
BEGIN
  a(1) := 10; a(2) := 9; a(3) := 2; a(4) := 5; a(5) := 3; a(6) := 7; a(7) := 101; a(8) := 18;
  FOR i IN 1 .. a.COUNT LOOP
    lo := 1; hi := len + 1;
    WHILE lo < hi LOOP
      mid := TRUNC((lo + hi) / 2);
      IF tails(mid) < a(i) THEN lo := mid + 1; ELSE hi := mid; END IF;
    END LOOP;
    tails(lo) := a(i);
    IF lo > len THEN len := lo; END IF;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(len);
END;
/
