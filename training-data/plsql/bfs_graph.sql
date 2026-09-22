-- Breadth-first traversal over a small edges table, using a nested table
-- as a FIFO queue (an index that only ever advances forward).
CREATE TABLE bfs_edges (
    node_from VARCHAR2(10),
    node_to VARCHAR2(10)
);

INSERT INTO bfs_edges VALUES ('a', 'b');
INSERT INTO bfs_edges VALUES ('a', 'c');
INSERT INTO bfs_edges VALUES ('b', 'd');
INSERT INTO bfs_edges VALUES ('b', 'e');
INSERT INTO bfs_edges VALUES ('c', 'f');
INSERT INTO bfs_edges VALUES ('e', 'f');

CREATE OR REPLACE TYPE varchar_table AS TABLE OF VARCHAR2(10);
/

CREATE OR REPLACE FUNCTION bfs_order(p_start IN VARCHAR2) RETURN varchar_table IS
    TYPE visited_set IS TABLE OF BOOLEAN INDEX BY VARCHAR2(10);
    visited visited_set;
    queue varchar_table := varchar_table();
    order_result varchar_table := varchar_table();
    head_idx NUMBER := 1;
    current_node VARCHAR2(10);
BEGIN
    queue.EXTEND;
    queue(1) := p_start;
    visited(p_start) := TRUE;
    WHILE head_idx <= queue.COUNT LOOP
        current_node := queue(head_idx);
        head_idx := head_idx + 1;
        order_result.EXTEND;
        order_result(order_result.COUNT) := current_node;
        FOR rec IN (SELECT node_to FROM bfs_edges WHERE node_from = current_node ORDER BY node_to) LOOP
            IF NOT visited.EXISTS(rec.node_to) THEN
                visited(rec.node_to) := TRUE;
                queue.EXTEND;
                queue(queue.COUNT) := rec.node_to;
            END IF;
        END LOOP;
    END LOOP;
    RETURN order_result;
END bfs_order;
/

DECLARE
    result varchar_table;
    out_str VARCHAR2(200) := '';
BEGIN
    result := bfs_order('a');
    FOR i IN 1..result.COUNT LOOP
        out_str := out_str || result(i);
        IF i < result.COUNT THEN
            out_str := out_str || ',';
        END IF;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(out_str);
END;
/
