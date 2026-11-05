DECLARE
  TYPE t_ids IS TABLE OF NUMBER;
  v_ids t_ids;
BEGIN
  SELECT level BULK COLLECT INTO v_ids FROM dual CONNECT BY level <= 10;
  FORALL i IN 1 .. v_ids.COUNT
    INSERT INTO audit_log (id) VALUES (v_ids(i));
  DBMS_OUTPUT.PUT_LINE('rows=' || SQL%ROWCOUNT);
END;
/
