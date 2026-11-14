BEGIN
  FOR r IN (SELECT department_id, COUNT(*) c FROM employees GROUP BY department_id) LOOP
    DBMS_OUTPUT.PUT_LINE(r.department_id || ': ' || r.c);
  END LOOP;
END;
/
