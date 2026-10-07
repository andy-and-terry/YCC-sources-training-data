-- Binds a user-named exception to a specific Oracle error number via
-- PRAGMA EXCEPTION_INIT, so a non-predefined ORA error can still be
-- caught by name instead of a generic WHEN OTHERS / SQLCODE check.
CREATE TABLE pragma_users (
    id NUMBER PRIMARY KEY,
    username VARCHAR2(30)
);

DECLARE
    e_duplicate_key EXCEPTION;
    PRAGMA EXCEPTION_INIT(e_duplicate_key, -1);
BEGIN
    INSERT INTO pragma_users VALUES (1, 'alice');
    INSERT INTO pragma_users VALUES (1, 'bob');
EXCEPTION
    WHEN e_duplicate_key THEN
        DBMS_OUTPUT.PUT_LINE('error: duplicate primary key (ORA-00001)');
END;
/
