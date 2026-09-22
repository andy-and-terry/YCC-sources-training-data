-- Two-colors a small edges table via BFS to check whether the (undirected)
-- graph it describes is bipartite. This sample graph is a triangle, which
-- is an odd cycle and therefore not bipartite.
CREATE TABLE bipartite_edges (
    node_from VARCHAR2(10),
    node_to VARCHAR2(10)
);

INSERT INTO bipartite_edges VALUES ('a', 'b');
INSERT INTO bipartite_edges VALUES ('b', 'c');
INSERT INTO bipartite_edges VALUES ('c', 'a');

CREATE OR REPLACE TYPE varchar_table AS TABLE OF VARCHAR2(10);
/

CREATE OR REPLACE FUNCTION is_bipartite(p_start IN VARCHAR2) RETURN VARCHAR2 IS
    TYPE color_map IS TABLE OF NUMBER INDEX BY VARCHAR2(10);
    color color_map;
    queue varchar_table := varchar_table();
    head_idx NUMBER := 1;
    current_node VARCHAR2(10);
    current_color NUMBER;
BEGIN
    queue.EXTEND;
    queue(1) := p_start;
    color(p_start) := 0;

    WHILE head_idx <= queue.COUNT LOOP
        current_node := queue(head_idx);
        head_idx := head_idx + 1;
        current_color := color(current_node);

        FOR rec IN (
            SELECT node_to AS neighbor FROM bipartite_edges WHERE node_from = current_node
            UNION
            SELECT node_from AS neighbor FROM bipartite_edges WHERE node_to = current_node
        ) LOOP
            IF NOT color.EXISTS(rec.neighbor) THEN
                color(rec.neighbor) := 1 - current_color;
                queue.EXTEND;
                queue(queue.COUNT) := rec.neighbor;
            ELSIF color(rec.neighbor) = current_color THEN
                RETURN 'FALSE';
            END IF;
        END LOOP;
    END LOOP;
    RETURN 'TRUE';
END is_bipartite;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE(is_bipartite('a'));
END;
/
