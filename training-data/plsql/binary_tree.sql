CREATE OR REPLACE TYPE tree_node AS OBJECT (
    node_value NUMBER,
    left_child REF tree_node,
    right_child REF tree_node
);
/

-- Simplified array-based binary tree simulation since PL/SQL object REFs
-- require a database table to back them.
CREATE OR REPLACE TYPE int_table AS TABLE OF NUMBER;
/

CREATE OR REPLACE FUNCTION build_bst(values_arr IN int_table) RETURN int_table IS
    sorted int_table := values_arr;
    temp NUMBER;
BEGIN
    FOR i IN 1..sorted.COUNT - 1 LOOP
        FOR j IN 1..sorted.COUNT - i LOOP
            IF sorted(j) > sorted(j + 1) THEN
                temp := sorted(j);
                sorted(j) := sorted(j + 1);
                sorted(j + 1) := temp;
            END IF;
        END LOOP;
    END LOOP;
    RETURN sorted;
END build_bst;
/
