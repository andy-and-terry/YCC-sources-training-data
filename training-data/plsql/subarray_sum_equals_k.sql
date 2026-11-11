-- Count contiguous subarrays whose sum equals k (prefix sums + associative array).
SET SERVEROUTPUT ON;
DECLARE
  TYPE seen_t IS TABLE OF PLS_INTEGER INDEX BY PLS_INTEGER;
  seen  seen_t;
  nums  SYS.ODCINUMBERLIST := SYS.ODCINUMBERLIST(1, 1, 1);
  k     CONSTANT PLS_INTEGER := 2;
  total PLS_INTEGER := 0;
  cnt   PLS_INTEGER := 0;
BEGIN
  seen(0) := 1;
  FOR i IN 1 .. nums.COUNT LOOP
    total := total + nums(i);
    IF seen.EXISTS(total - k) THEN
      cnt := cnt + seen(total - k);
    END IF;
    seen(total) := (CASE WHEN seen.EXISTS(total) THEN seen(total) ELSE 0 END) + 1;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(cnt);
END;
/
