library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Max_Of_Array is
    Port ( a, b, c, d : in  STD_LOGIC_VECTOR(7 downto 0);
           max_val      : out STD_LOGIC_VECTOR(7 downto 0));
end Max_Of_Array;

architecture Behavioral of Max_Of_Array is
    signal max_ab, max_cd : STD_LOGIC_VECTOR(7 downto 0);
begin
    max_ab <= a when a > b else b;
    max_cd <= c when c > d else d;
    max_val <= max_ab when max_ab > max_cd else max_cd;
end Behavioral;
