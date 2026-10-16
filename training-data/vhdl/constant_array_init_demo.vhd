library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- 2-D constant array used as a small coefficient table.
entity Coefficient_Table is
    Port ( row, col : in  integer range 0 to 2;
           value    : out signed(7 downto 0));
end Coefficient_Table;

architecture Behavioral of Coefficient_Table is
    type matrix_t is array (0 to 2, 0 to 2) of integer range -128 to 127;
    constant KERNEL : matrix_t := (
        ( 1,  2,  1),
        ( 0,  0,  0),
        (-1, -2, -1));
begin
    value <= to_signed(KERNEL(row, col), 8);
end Behavioral;
