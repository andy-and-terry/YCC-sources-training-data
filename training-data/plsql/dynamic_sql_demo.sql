CREATE TABLE dyn_demo_items (
    id NUMBER,
    name VARCHAR2(50)
);

INSERT INTO dyn_demo_items VALUES (1, 'Widget');
INSERT INTO dyn_demo_items VALUES (2, 'Gadget');

CREATE OR REPLACE PROCEDURE insert_dynamic(
    p_table_name IN VARCHAR2,
    p_id IN NUMBER,
    p_name IN VARCHAR2
) IS
BEGIN
    EXECUTE IMMEDIATE 'INSERT INTO ' || p_table_name || ' (id, name) VALUES (:1, :2)'
        USING p_id, p_name;
END insert_dynamic;
/

CREATE OR REPLACE PROCEDURE query_table_dynamic(p_table_name IN VARCHAR2) IS
    TYPE ref_cursor IS REF CURSOR;
    c ref_cursor;
    v_id NUMBER;
    v_name VARCHAR2(50);
BEGIN
    OPEN c FOR 'SELECT id, name FROM ' || p_table_name || ' ORDER BY id';
    LOOP
        FETCH c INTO v_id, v_name;
        EXIT WHEN c%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_id || ': ' || v_name);
    END LOOP;
    CLOSE c;
END query_table_dynamic;
/
