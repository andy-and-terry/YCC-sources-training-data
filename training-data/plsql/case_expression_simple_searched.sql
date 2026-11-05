DECLARE
  v_grade CHAR(1) := 'B';
  v_score NUMBER := 77;
  v_text  VARCHAR2(20);
BEGIN
  v_text := CASE v_grade WHEN 'A' THEN 'top' WHEN 'B' THEN 'good' ELSE 'other' END;
  DBMS_OUTPUT.PUT_LINE(v_text);
  DBMS_OUTPUT.PUT_LINE(CASE WHEN v_score >= 90 THEN 'A' WHEN v_score >= 70 THEN 'C' ELSE 'F' END);
END;
/
