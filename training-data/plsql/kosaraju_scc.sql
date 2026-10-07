-- Kosaraju's algorithm finds strongly connected components with two DFS
-- passes: order nodes by DFS finish time on the graph, then DFS the
-- transposed (reversed-edge) graph in reverse finish-time order, where
-- each tree found is one SCC.
CREATE TABLE scc_edges (
    node_from VARCHAR2(10),
    node_to VARCHAR2(10)
);

-- 0 -> 1 -> 2 -> 0 is a cycle, and 3 -> 4 -> 3 is a cycle, so the two
-- expected SCCs are {0, 1, 2} and {3, 4}.
INSERT INTO scc_edges VALUES ('0', '1');
INSERT INTO scc_edges VALUES ('1', '2');
INSERT INTO scc_edges VALUES ('2', '0');
INSERT INTO scc_edges VALUES ('2', '3');
INSERT INTO scc_edges VALUES ('3', '4');
INSERT INTO scc_edges VALUES ('4', '3');

CREATE OR REPLACE PACKAGE kosaraju_pkg IS
    PROCEDURE run;
END kosaraju_pkg;
/

CREATE OR REPLACE PACKAGE BODY kosaraju_pkg IS
    TYPE bool_map IS TABLE OF BOOLEAN INDEX BY VARCHAR2(10);
    TYPE order_list IS TABLE OF VARCHAR2(10) INDEX BY PLS_INTEGER;

    visited bool_map;
    assigned bool_map;
    finish_order order_list;
    finish_count PLS_INTEGER := 0;

    PROCEDURE dfs1(p_node IN VARCHAR2) IS
    BEGIN
        visited(p_node) := TRUE;
        FOR rec IN (SELECT node_to FROM scc_edges WHERE node_from = p_node) LOOP
            IF NOT visited.EXISTS(rec.node_to) THEN
                dfs1(rec.node_to);
            END IF;
        END LOOP;
        finish_count := finish_count + 1;
        finish_order(finish_count) := p_node;
    END dfs1;

    PROCEDURE dfs2(p_node IN VARCHAR2, p_component IN OUT NOCOPY VARCHAR2) IS
    BEGIN
        assigned(p_node) := TRUE;
        p_component := p_component || p_node || ',';
        FOR rec IN (SELECT node_from FROM scc_edges WHERE node_to = p_node) LOOP
            IF NOT assigned.EXISTS(rec.node_from) THEN
                dfs2(rec.node_from, p_component);
            END IF;
        END LOOP;
    END dfs2;

    PROCEDURE run IS
        v_component VARCHAR2(200);
    BEGIN
        FOR rec IN (
            SELECT node_from AS node FROM scc_edges
            UNION
            SELECT node_to FROM scc_edges
        ) LOOP
            IF NOT visited.EXISTS(rec.node) THEN
                dfs1(rec.node);
            END IF;
        END LOOP;

        FOR i IN REVERSE 1..finish_count LOOP
            IF NOT assigned.EXISTS(finish_order(i)) THEN
                v_component := '';
                dfs2(finish_order(i), v_component);
                DBMS_OUTPUT.PUT_LINE(v_component);
            END IF;
        END LOOP;
    END run;
END kosaraju_pkg;
/

BEGIN
    kosaraju_pkg.run;
END;
/
