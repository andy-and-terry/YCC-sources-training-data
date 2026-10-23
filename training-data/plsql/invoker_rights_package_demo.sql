-- A package using AUTHID CURRENT_USER runs with the privileges and name
-- resolution of the caller (invoker rights) instead of the package owner.
-- Overloading and a private helper are shown in the same spec/body pair.
CREATE OR REPLACE PACKAGE util_fmt AUTHID CURRENT_USER AS
    FUNCTION fmt(p_value NUMBER)   RETURN VARCHAR2;
    FUNCTION fmt(p_value DATE)     RETURN VARCHAR2;
    FUNCTION fmt(p_value BOOLEAN)  RETURN VARCHAR2;
    FUNCTION current_caller        RETURN VARCHAR2;
END util_fmt;
/

CREATE OR REPLACE PACKAGE BODY util_fmt AS
    -- private: not visible outside the body
    FUNCTION wrap(p_text VARCHAR2) RETURN VARCHAR2 IS
    BEGIN
        RETURN '<' || p_text || '>';
    END wrap;

    FUNCTION fmt(p_value NUMBER) RETURN VARCHAR2 IS
    BEGIN
        RETURN wrap(TO_CHAR(p_value, 'FM999G999D00'));
    END fmt;

    FUNCTION fmt(p_value DATE) RETURN VARCHAR2 IS
    BEGIN
        RETURN wrap(TO_CHAR(p_value, 'YYYY-MM-DD'));
    END fmt;

    FUNCTION fmt(p_value BOOLEAN) RETURN VARCHAR2 IS
    BEGIN
        RETURN wrap(CASE WHEN p_value THEN 'yes' WHEN NOT p_value THEN 'no' ELSE 'unknown' END);
    END fmt;

    FUNCTION current_caller RETURN VARCHAR2 IS
    BEGIN
        RETURN SYS_CONTEXT('USERENV', 'CURRENT_USER');
    END current_caller;
END util_fmt;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE(util_fmt.fmt(1234567.5));
    DBMS_OUTPUT.PUT_LINE(util_fmt.fmt(DATE '2024-03-15'));
    DBMS_OUTPUT.PUT_LINE(util_fmt.fmt(TRUE));
    DBMS_OUTPUT.PUT_LINE('caller: ' || util_fmt.current_caller);
END;
/
