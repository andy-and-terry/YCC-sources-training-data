DECLARE
  v_name employees.last_name%TYPE;
BEGIN
  SELECT last_name INTO v_name FROM employees WHERE employee_id = -1;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('no such employee');
  WHEN TOO_MANY_ROWS THEN
    DBMS_OUTPUT.PUT_LINE('ambiguous');
END;
/
