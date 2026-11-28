-- Jaccard similarity using nested-table MULTISET operators
SET SERVEROUTPUT ON;
DECLARE
  TYPE t_set IS TABLE OF PLS_INTEGER;
  a t_set := t_set(1, 2, 3, 4);
  b t_set := t_set(3, 4, 5);
  inter t_set := a MULTISET INTERSECT DISTINCT b;
  uni   t_set := a MULTISET UNION DISTINCT b;
BEGIN
  DBMS_OUTPUT.PUT_LINE(ROUND(inter.COUNT / uni.COUNT, 2));
END;
/
