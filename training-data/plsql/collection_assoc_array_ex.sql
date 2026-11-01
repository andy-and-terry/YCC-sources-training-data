DECLARE
  TYPE t_map IS TABLE OF NUMBER INDEX BY VARCHAR2(20);
  m t_map;
  k VARCHAR2(20);
BEGIN
  m('apple') := 3;
  m('pear')  := 5;
  k := m.FIRST;
  WHILE k IS NOT NULL LOOP
    DBMS_OUTPUT.PUT_LINE(k || '=' || m(k));
    k := m.NEXT(k);
  END LOOP;
END;
/
