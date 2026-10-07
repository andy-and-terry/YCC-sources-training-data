library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Wallace_Tree_Multiplier_4bit is
    Port ( a       : in  STD_LOGIC_VECTOR(3 downto 0);
           b       : in  STD_LOGIC_VECTOR(3 downto 0);
           product : out STD_LOGIC_VECTOR(7 downto 0));
end Wallace_Tree_Multiplier_4bit;

architecture Behavioral of Wallace_Tree_Multiplier_4bit is
    signal pp0, pp1, pp2, pp3 : unsigned(3 downto 0);
    signal row1_sum, row2_sum : unsigned(4 downto 0);
begin
    pp0 <= unsigned(a) and (3 downto 0 => b(0));
    pp1 <= unsigned(a) and (3 downto 0 => b(1));
    pp2 <= unsigned(a) and (3 downto 0 => b(2));
    pp3 <= unsigned(a) and (3 downto 0 => b(3));

    row1_sum <= ('0' & pp0) + (pp1 & '0');
    row2_sum <= ('0' & pp2) + (pp3 & '0');

    product <= std_logic_vector(resize(row1_sum, 8) + shift_left(resize(row2_sum, 8), 2));
end Behavioral;
