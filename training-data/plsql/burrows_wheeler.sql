DECLARE
  s CONSTANT VARCHAR2(10) := 'banana$';
  TYPE str_tab IS TABLE OF VARCHAR2(10) INDEX BY PLS_INTEGER;
  rots str_tab; tmp VARCHAR2(10); j PLS_INTEGER; res VARCHAR2(10);
BEGIN
  FOR i IN 1 .. LENGTH(s) LOOP
    rots(i) := SUBSTR(s, i) || SUBSTR(s, 1, i - 1);
  END LOOP;
  FOR i IN 2 .. rots.COUNT LOOP
    tmp := rots(i); j := i - 1;
    WHILE j >= 1 AND rots(j) > tmp LOOP
      rots(j + 1) := rots(j); j := j - 1;
    END LOOP;
    rots(j + 1) := tmp;
  END LOOP;
  FOR i IN 1 .. rots.COUNT LOOP
    res := res || SUBSTR(rots(i), -1);
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(res);
END;
/
