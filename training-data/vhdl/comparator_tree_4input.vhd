library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Comparator_Tree_4input is
    Port ( a, b, c, d : in  STD_LOGIC_VECTOR(7 downto 0);
           max_val     : out STD_LOGIC_VECTOR(7 downto 0));
end Comparator_Tree_4input;

architecture Behavioral of Comparator_Tree_4input is
    signal max_ab, max_cd : STD_LOGIC_VECTOR(7 downto 0);
begin
    max_ab <= a when a > b else b;
    max_cd <= c when c > d else d;
    max_val <= max_ab when max_ab > max_cd else max_cd;
end Behavioral;
