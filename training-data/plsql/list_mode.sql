DECLARE
  TYPE t_counts IS TABLE OF PLS_INTEGER INDEX BY PLS_INTEGER;
  l_counts t_counts;
  l_items  SYS.ODCINUMBERLIST := SYS.ODCINUMBERLIST(1, 2, 2, 3, 3, 4);
  l_top    PLS_INTEGER := 0;
  l_key    PLS_INTEGER;
BEGIN
  FOR i IN 1 .. l_items.COUNT LOOP
    l_counts(l_items(i)) := NVL(CASE WHEN l_counts.EXISTS(l_items(i)) THEN l_counts(l_items(i)) END, 0) + 1;
    l_top := GREATEST(l_top, l_counts(l_items(i)));
  END LOOP;

  l_key := l_counts.FIRST;
  WHILE l_key IS NOT NULL LOOP
    IF l_counts(l_key) = l_top THEN
      DBMS_OUTPUT.PUT_LINE('mode: ' || l_key);
    END IF;
    l_key := l_counts.NEXT(l_key);
  END LOOP;
END;
/
