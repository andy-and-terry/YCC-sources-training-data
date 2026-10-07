-- Tarjan's strongly connected components over a small adjacency table.
CREATE TABLE scc_edges (
    node_from NUMBER,
    node_to NUMBER
);

INSERT INTO scc_edges VALUES (0, 1);
INSERT INTO scc_edges VALUES (1, 2);
INSERT INTO scc_edges VALUES (2, 0);
INSERT INTO scc_edges VALUES (2, 3);
INSERT INTO scc_edges VALUES (3, 4);
INSERT INTO scc_edges VALUES (4, 3);

DECLARE
    TYPE num_map IS TABLE OF NUMBER INDEX BY BINARY_INTEGER;
    TYPE bool_map IS TABLE OF NUMBER INDEX BY BINARY_INTEGER;
    idx_ num_map;
    lowlink num_map;
    on_stack bool_map;
    TYPE stack_type IS TABLE OF NUMBER;
    stk stack_type := stack_type();
    counter NUMBER := 0;
    node_count NUMBER := 5;

    PROCEDURE strong_connect(v IN NUMBER) IS
    BEGIN
        idx_(v) := counter;
        lowlink(v) := counter;
        counter := counter + 1;
        stk.EXTEND;
        stk(stk.COUNT) := v;
        on_stack(v) := 1;

        FOR rec IN (SELECT node_to FROM scc_edges WHERE node_from = v) LOOP
            IF NOT idx_.EXISTS(rec.node_to) THEN
                strong_connect(rec.node_to);
                lowlink(v) := LEAST(lowlink(v), lowlink(rec.node_to));
            ELSIF on_stack(rec.node_to) = 1 THEN
                lowlink(v) := LEAST(lowlink(v), idx_(rec.node_to));
            END IF;
        END LOOP;

        IF lowlink(v) = idx_(v) THEN
            DECLARE
                line VARCHAR2(200) := '';
                w NUMBER;
            BEGIN
                LOOP
                    w := stk(stk.COUNT);
                    stk.TRIM;
                    on_stack(w) := 0;
                    line := line || w || ' ';
                    EXIT WHEN w = v;
                END LOOP;
                DBMS_OUTPUT.PUT_LINE(line);
            END;
        END IF;
    END strong_connect;
BEGIN
    FOR v IN 0..node_count - 1 LOOP
        IF NOT idx_.EXISTS(v) THEN
            strong_connect(v);
        END IF;
    END LOOP;
END;
/
