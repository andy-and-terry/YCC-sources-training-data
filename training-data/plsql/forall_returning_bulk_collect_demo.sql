CREATE TABLE tasks (
    id       NUMBER PRIMARY KEY,
    title    VARCHAR2(30),
    priority NUMBER
);

INSERT INTO tasks VALUES (1, 'write docs', 3);
INSERT INTO tasks VALUES (2, 'fix bug', 1);
INSERT INTO tasks VALUES (3, 'review PR', 2);
INSERT INTO tasks VALUES (4, 'deploy', 1);
COMMIT;

DECLARE
    TYPE id_list    IS TABLE OF tasks.id%TYPE;
    TYPE title_list IS TABLE OF tasks.title%TYPE;
    ids        id_list := id_list(1, 3, 4);
    old_titles title_list;
    new_prio   NUMBER;
BEGIN
    -- single-row DML with RETURNING INTO
    UPDATE tasks
       SET priority = priority + 10
     WHERE id = 2
    RETURNING priority INTO new_prio;
    DBMS_OUTPUT.PUT_LINE('task 2 new priority: ' || new_prio);

    -- FORALL with RETURNING BULK COLLECT captures one value per bound id
    FORALL i IN 1 .. ids.COUNT
        UPDATE tasks
           SET title = UPPER(title)
         WHERE id = ids(i)
        RETURNING title BULK COLLECT INTO old_titles;

    DBMS_OUTPUT.PUT_LINE('updated rows: ' || old_titles.COUNT);
    FOR i IN 1 .. old_titles.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('  ' || old_titles(i));
    END LOOP;

    -- DELETE ... RETURNING BULK COLLECT without FORALL
    DELETE FROM tasks WHERE priority >= 10
    RETURNING title BULK COLLECT INTO old_titles;
    DBMS_OUTPUT.PUT_LINE('deleted: ' || old_titles(1));

    ROLLBACK;
END;
/

DROP TABLE tasks;
