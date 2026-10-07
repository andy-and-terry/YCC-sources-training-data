CREATE OR REPLACE FUNCTION current_caller
    RETURN VARCHAR2
    AUTHID CURRENT_USER
IS
BEGIN
    -- Runs with the privileges of the caller, not the owner.
    RETURN 'session user=' || SYS_CONTEXT('USERENV', 'SESSION_USER') ||
           ', current schema=' || SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA');
END current_caller;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE(current_caller);
END;
/
