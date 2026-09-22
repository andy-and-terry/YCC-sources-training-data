CREATE TABLE dept_stats (
    dept_name VARCHAR2(20),
    emp_count NUMBER
);

INSERT INTO dept_stats VALUES ('Engineering', 42);
INSERT INTO dept_stats VALUES ('Sales', 17);

CREATE OR REPLACE PROCEDURE count_rows(p_table_name IN VARCHAR2, p_count OUT NUMBER) IS
BEGIN
    EXECUTE IMMEDIATE 'SELECT COUNT(*) FROM ' || p_table_name INTO p_count;
END count_rows;
/

CREATE OR REPLACE PROCEDURE create_summary_table(p_table_name IN VARCHAR2) IS
BEGIN
    EXECUTE IMMEDIATE 'CREATE TABLE ' || p_table_name || ' (label VARCHAR2(20), value NUMBER)';
END create_summary_table;
/

DECLARE
    v_count NUMBER;
BEGIN
    count_rows('dept_stats', v_count);
    DBMS_OUTPUT.PUT_LINE('dept_stats row count: ' || v_count);

    create_summary_table('run_summary');
    EXECUTE IMMEDIATE 'INSERT INTO run_summary VALUES (:1, :2)' USING 'rows_seen', v_count;
    COMMIT;

    FOR rec IN (SELECT label, value FROM run_summary) LOOP
        DBMS_OUTPUT.PUT_LINE(rec.label || ' = ' || rec.value);
    END LOOP;
END;
/
