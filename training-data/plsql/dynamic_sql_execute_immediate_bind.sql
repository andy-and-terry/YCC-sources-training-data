DECLARE
  v_count NUMBER;
  v_sql   VARCHAR2(200) := 'SELECT COUNT(*) FROM dual WHERE dummy = :1';
BEGIN
  EXECUTE IMMEDIATE v_sql INTO v_count USING 'X';
  DBMS_OUTPUT.PUT_LINE('count=' || v_count);
END;
/
