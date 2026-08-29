CREATE TABLE log_entries (
    entry_id NUMBER GENERATED ALWAYS AS IDENTITY,
    message VARCHAR2(200)
);

CREATE OR REPLACE PROCEDURE log_message(p_message IN VARCHAR2) IS
    PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
    INSERT INTO log_entries (message) VALUES (p_message);
    COMMIT;
END log_message;
/
