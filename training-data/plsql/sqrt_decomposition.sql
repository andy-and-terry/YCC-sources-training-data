DECLARE
  TYPE num_tab IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
  a num_tab; blk num_tab; bs CONSTANT PLS_INTEGER := 4;
  s NUMBER := 0; i PLS_INTEGER;
BEGIN
  FOR k IN 0 .. 11 LOOP a(k) := MOD(k * 7 + 3, 10); END LOOP;
  FOR b IN 0 .. 2 LOOP blk(b) := 0; END LOOP;
  FOR k IN 0 .. 11 LOOP blk(TRUNC(k / bs)) := blk(TRUNC(k / bs)) + a(k); END LOOP;
  i := 2;
  WHILE i <= 9 LOOP
    IF MOD(i, bs) = 0 AND i + bs - 1 <= 9 THEN
      s := s + blk(TRUNC(i / bs)); i := i + bs;
    ELSE
      s := s + a(i); i := i + 1;
    END IF;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(s);
END;
/
