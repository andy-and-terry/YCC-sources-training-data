-- An exception not handled in the block that raises it propagates up the
-- call stack; RAISE with no arguments re-raises the current exception
-- after logging, preserving its original error code and message.
CREATE OR REPLACE PROCEDURE inner_step(p_value IN NUMBER) IS
BEGIN
    IF p_value < 0 THEN
        RAISE_APPLICATION_ERROR(-20050, 'negative value not allowed: ' || p_value);
    END IF;
    DBMS_OUTPUT.PUT_LINE('inner_step ok: ' || p_value);
END inner_step;
/

CREATE OR REPLACE PROCEDURE middle_step(p_value IN NUMBER) IS
BEGIN
    inner_step(p_value);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('middle_step logging before re-raise: ' || SQLERRM);
        RAISE;
END middle_step;
/

BEGIN
    middle_step(5);
    middle_step(-3);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('outer handler caught: ' || SQLERRM);
END;
/
