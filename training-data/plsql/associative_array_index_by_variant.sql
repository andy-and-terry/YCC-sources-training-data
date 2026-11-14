DECLARE
  TYPE cnt_t IS TABLE OF PLS_INTEGER INDEX BY VARCHAR2(20);
  c cnt_t;
  k VARCHAR2(20);
BEGIN
  FOR w IN (SELECT 'a' x FROM dual UNION ALL SELECT 'b' FROM dual UNION ALL SELECT 'a' FROM dual) LOOP
    IF c.EXISTS(w.x) THEN c(w.x) := c(w.x) + 1; ELSE c(w.x) := 1; END IF;
  END LOOP;
  k := c.FIRST;
  WHILE k IS NOT NULL LOOP DBMS_OUTPUT.PUT_LINE(k || '=' || c(k)); k := c.NEXT(k); END LOOP;
END;
/
