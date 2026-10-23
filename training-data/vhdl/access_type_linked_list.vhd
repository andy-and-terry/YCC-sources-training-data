library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Access types (pointers) building a small linked list in simulation.
entity access_type_linked_list is
end access_type_linked_list;

architecture Behavioral of access_type_linked_list is
    type node_t;
    type node_ptr is access node_t;
    type node_t is record
        value : integer;
        next_node : node_ptr;
    end record;
begin
    process
        variable head, cur, n : node_ptr := null;
        variable total : integer := 0;
        variable count : integer := 0;
    begin
        -- Push 1..5 at the head
        for i in 1 to 5 loop
            n := new node_t;
            n.value := i * 10;
            n.next_node := head;
            head := n;
        end loop;

        -- Traverse
        cur := head;
        while cur /= null loop
            report "node = " & integer'image(cur.value);
            total := total + cur.value;
            count := count + 1;
            cur := cur.next_node;
        end loop;
        report "count = " & integer'image(count) & ", sum = " & integer'image(total);
        assert total = 150 report "sum mismatch" severity failure;

        -- Free the list
        while head /= null loop
            cur := head;
            head := head.next_node;
            deallocate(cur);
        end loop;
        wait;
    end process;
end Behavioral;
