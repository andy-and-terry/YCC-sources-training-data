DECLARE
    TYPE emp_rec IS RECORD (name VARCHAR2(30), dept VARCHAR2(10), pay NUMBER);
    TYPE emp_tab IS TABLE OF emp_rec;
    emps emp_tab := emp_tab();
    CURSOR c_totals IS
        SELECT dept, SUM(pay) AS total FROM (
            SELECT 'a' name, 'eng' dept, 100 pay FROM dual UNION ALL
            SELECT 'b', 'eng', 200 FROM dual UNION ALL
            SELECT 'c', 'ops', 50 FROM dual)
        GROUP BY dept ORDER BY dept;
BEGIN
    FOR r IN c_totals LOOP
        DBMS_OUTPUT.PUT_LINE(r.dept || ' ' || r.total);
    END LOOP;
    emps.EXTEND(2);
    emps(1).name := 'x'; emps(1).pay := 10;
    emps(2).name := 'y'; emps(2).pay := 20;
    DBMS_OUTPUT.PUT_LINE(emps.COUNT || ' ' || (emps(1).pay + emps(2).pay));
END;
/
