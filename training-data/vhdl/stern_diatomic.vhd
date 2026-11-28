library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Computes s(i) of Stern's diatomic sequence combinationally by recursion unrolled into a table
entity Stern_Table is
    Port ( idx : in  integer range 0 to 14;
           val : out integer range 0 to 5);
end Stern_Table;

architecture Behavioral of Stern_Table is
    type table_t is array (0 to 14) of integer range 0 to 5;
    function build return table_t is
        variable t : table_t;
    begin
        t(0) := 0;
        t(1) := 1;
        for i in 2 to 14 loop
            if i mod 2 = 0 then
                t(i) := t(i / 2);
            else
                t(i) := t(i / 2) + t(i / 2 + 1);
            end if;
        end loop;
        return t;
    end function;
    constant TABLE : table_t := build;  -- 0 1 1 2 1 3 2 3 1 4 3 5 2 5 3
begin
    val <= TABLE(idx);
end Behavioral;
