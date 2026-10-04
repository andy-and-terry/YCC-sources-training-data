CREATE TABLE unique_codes (code VARCHAR2(5) PRIMARY KEY);

DECLARE
    TYPE code_list IS TABLE OF VARCHAR2(10);
    codes code_list := code_list('A1', 'B2', 'A1', 'TOOLONGCODE', 'C3');
    bulk_errors EXCEPTION;
    PRAGMA EXCEPTION_INIT(bulk_errors, -24381);
    total NUMBER;
BEGIN
    BEGIN
        FORALL i IN 1 .. codes.COUNT SAVE EXCEPTIONS
            INSERT INTO unique_codes VALUES (codes(i));
    EXCEPTION
        WHEN bulk_errors THEN
            FOR j IN 1 .. SQL%BULK_EXCEPTIONS.COUNT LOOP
                DBMS_OUTPUT.PUT_LINE('row ' || SQL%BULK_EXCEPTIONS(j).ERROR_INDEX ||
                                     ' failed: ' || SQLERRM(-SQL%BULK_EXCEPTIONS(j).ERROR_CODE));
            END LOOP;
    END;
    SELECT COUNT(*) INTO total FROM unique_codes;
    DBMS_OUTPUT.PUT_LINE('rows inserted: ' || total);
END;
/
