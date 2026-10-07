-- Detects a cycle in a small directed-edges table via DFS with a
-- three-color (unvisited/visiting/done) associative array, since PL/SQL
-- has no native graph collection type.
CREATE TABLE cycle_edges (
    node_from VARCHAR2(10),
    node_to VARCHAR2(10)
);

INSERT INTO cycle_edges VALUES ('a', 'b');
INSERT INTO cycle_edges VALUES ('b', 'c');
INSERT INTO cycle_edges VALUES ('c', 'a');
INSERT INTO cycle_edges VALUES ('c', 'd');

CREATE OR REPLACE PACKAGE cycle_pkg IS
    TYPE state_map IS TABLE OF NUMBER INDEX BY VARCHAR2(10);
    FUNCTION has_cycle_from(state IN OUT NOCOPY state_map, node IN VARCHAR2) RETURN BOOLEAN;
    FUNCTION graph_has_cycle RETURN BOOLEAN;
END cycle_pkg;
/

CREATE OR REPLACE PACKAGE BODY cycle_pkg IS
    FUNCTION has_cycle_from(state IN OUT NOCOPY state_map, node IN VARCHAR2) RETURN BOOLEAN IS
    BEGIN
        state(node) := 1; -- visiting
        FOR rec IN (SELECT node_to FROM cycle_edges WHERE node_from = node) LOOP
            IF NOT state.EXISTS(rec.node_to) THEN
                state(rec.node_to) := 0;
            END IF;
            IF state(rec.node_to) = 1 THEN
                RETURN TRUE; -- back edge to a node still on the stack
            ELSIF state(rec.node_to) = 0 THEN
                IF has_cycle_from(state, rec.node_to) THEN
                    RETURN TRUE;
                END IF;
            END IF;
        END LOOP;
        state(node) := 2; -- done
        RETURN FALSE;
    END has_cycle_from;

    FUNCTION graph_has_cycle RETURN BOOLEAN IS
        state state_map;
    BEGIN
        FOR rec IN (
            SELECT DISTINCT node_from AS node FROM cycle_edges
            UNION
            SELECT DISTINCT node_to FROM cycle_edges
        ) LOOP
            state(rec.node) := 0;
        END LOOP;

        FOR rec IN (
            SELECT DISTINCT node_from AS node FROM cycle_edges
            UNION
            SELECT DISTINCT node_to FROM cycle_edges
        ) LOOP
            IF state(rec.node) = 0 THEN
                IF has_cycle_from(state, rec.node) THEN
                    RETURN TRUE;
                END IF;
            END IF;
        END LOOP;
        RETURN FALSE;
    END graph_has_cycle;
END cycle_pkg;
/

BEGIN
    IF cycle_pkg.graph_has_cycle THEN
        DBMS_OUTPUT.PUT_LINE('cycle detected');
    ELSE
        DBMS_OUTPUT.PUT_LINE('no cycle');
    END IF;
END;
/
