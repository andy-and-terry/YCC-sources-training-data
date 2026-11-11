-- Bulls and Cows scoring for equal-length digit strings.
SET SERVEROUTPUT ON;
DECLARE
  TYPE counts IS TABLE OF PLS_INTEGER INDEX BY VARCHAR2(1);
  sc counts;
  gc counts;
  secret CONSTANT VARCHAR2(4) := '1807';
  guess  CONSTANT VARCHAR2(4) := '7810';
  bulls PLS_INTEGER := 0;
  cows  PLS_INTEGER := 0;
  s VARCHAR2(1);
  g VARCHAR2(1);
  k VARCHAR2(1);
BEGIN
  FOR i IN 1 .. LENGTH(secret) LOOP
    s := SUBSTR(secret, i, 1);
    g := SUBSTR(guess, i, 1);
    IF s = g THEN
      bulls := bulls + 1;
    ELSE
      sc(s) := (CASE WHEN sc.EXISTS(s) THEN sc(s) ELSE 0 END) + 1;
      gc(g) := (CASE WHEN gc.EXISTS(g) THEN gc(g) ELSE 0 END) + 1;
    END IF;
  END LOOP;
  k := sc.FIRST;
  WHILE k IS NOT NULL LOOP
    IF gc.EXISTS(k) THEN
      cows := cows + LEAST(sc(k), gc(k));
    END IF;
    k := sc.NEXT(k);
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(bulls || ' bull(s), ' || cows || ' cow(s)');
END;
/
