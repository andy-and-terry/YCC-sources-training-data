BEGIN
    UPDATE employees SET salary = salary + 1 WHERE department_id = 50;
    IF SQL%FOUND THEN
        DBMS_OUTPUT.PUT_LINE('updated rows: ' || SQL%ROWCOUNT);
    END IF;

    DELETE FROM employees WHERE employee_id = -1;
    IF SQL%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('nothing deleted, rowcount=' || SQL%ROWCOUNT);
    END IF;

    DBMS_OUTPUT.PUT_LINE('implicit cursor open? ' ||
        CASE WHEN SQL%ISOPEN THEN 'yes' ELSE 'no (closed after statement)' END);
    ROLLBACK;
END;
/
