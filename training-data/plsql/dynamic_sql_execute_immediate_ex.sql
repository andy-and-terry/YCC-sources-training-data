DECLARE
  v_count NUMBER;
  v_table VARCHAR2(30) := 'EMPLOYEES';
BEGIN
  EXECUTE IMMEDIATE 'SELECT COUNT(*) FROM ' || DBMS_ASSERT.SIMPLE_SQL_NAME(v_table) INTO v_count;
  DBMS_OUTPUT.PUT_LINE(v_table || ': ' || v_count);
  EXECUTE IMMEDIATE 'UPDATE employees SET salary = salary + :1 WHERE employee_id = :2' USING 100, 101;
END;
/
