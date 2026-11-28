DECLARE
  s CONSTANT VARCHAR2(20) := 'banana';
  n PLS_INTEGER := LENGTH(s);
  i PLS_INTEGER := 1; j PLS_INTEGER; k PLS_INTEGER;
BEGIN
  WHILE i <= n LOOP
    j := i + 1; k := i;
    WHILE j <= n AND SUBSTR(s, k, 1) <= SUBSTR(s, j, 1) LOOP
      IF SUBSTR(s, k, 1) < SUBSTR(s, j, 1) THEN k := i; ELSE k := k + 1; END IF;
      j := j + 1;
    END LOOP;
    WHILE i <= k LOOP
      DBMS_OUTPUT.PUT_LINE(SUBSTR(s, i, j - k));
      i := i + (j - k);
    END LOOP;
  END LOOP;
END;
/
