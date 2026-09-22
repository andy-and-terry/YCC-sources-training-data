-- A graph is bipartite iff its nodes can be 2-colored so that no edge
-- joins two same-colored nodes. BFS assigns alternating colors from each
-- unvisited node and fails as soon as an edge forces a clash.
CREATE TABLE bipartite_edges (
    node_from VARCHAR2(10),
    node_to   VARCHAR2(10)
);

INSERT INTO bipartite_edges VALUES ('a', 'b');
INSERT INTO bipartite_edges VALUES ('b', 'c');
INSERT INTO bipartite_edges VALUES ('c', 'd');
INSERT INTO bipartite_edges VALUES ('d', 'a');

CREATE OR REPLACE FUNCTION is_bipartite RETURN VARCHAR2 IS
    TYPE color_map IS TABLE OF NUMBER INDEX BY VARCHAR2(10);
    TYPE queue_t IS TABLE OF VARCHAR2(10);
    colors color_map;
    queue queue_t := queue_t();
    head_idx NUMBER;
    current_node VARCHAR2(10);
    all_nodes queue_t := queue_t();
BEGIN
    FOR rec IN (
        SELECT node_from AS node FROM bipartite_edges
        UNION
        SELECT node_to AS node FROM bipartite_edges
        ORDER BY 1
    ) LOOP
        all_nodes.EXTEND;
        all_nodes(all_nodes.COUNT) := rec.node;
    END LOOP;

    FOR i IN 1..all_nodes.COUNT LOOP
        IF colors.EXISTS(all_nodes(i)) THEN
            CONTINUE;
        END IF;

        colors(all_nodes(i)) := 0;
        queue := queue_t();
        queue.EXTEND;
        queue(1) := all_nodes(i);
        head_idx := 1;

        WHILE head_idx <= queue.COUNT LOOP
            current_node := queue(head_idx);
            head_idx := head_idx + 1;

            FOR rec IN (
                SELECT node_to AS neighbor FROM bipartite_edges WHERE node_from = current_node
                UNION
                SELECT node_from AS neighbor FROM bipartite_edges WHERE node_to = current_node
            ) LOOP
                IF NOT colors.EXISTS(rec.neighbor) THEN
                    colors(rec.neighbor) := 1 - colors(current_node);
                    queue.EXTEND;
                    queue(queue.COUNT) := rec.neighbor;
                ELSIF colors(rec.neighbor) = colors(current_node) THEN
                    RETURN 'NOT BIPARTITE';
                END IF;
            END LOOP;
        END LOOP;
    END LOOP;

    RETURN 'BIPARTITE';
END is_bipartite;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE(is_bipartite);
END;
/
