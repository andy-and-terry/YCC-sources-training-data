DECLARE
  TYPE t_map IS TABLE OF NUMBER INDEX BY VARCHAR2(10);
  m t_map;
  k VARCHAR2(10);
BEGIN
  m('a') := 1; m('b') := 2; m('c') := 3;
  k := m.FIRST;
  WHILE k IS NOT NULL LOOP
    DBMS_OUTPUT.PUT_LINE(k || '=' || m(k));
    k := m.NEXT(k);
  END LOOP;
END;
/
