library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Magnitude_Comparator_4bit is
    Port ( a, b       : in  STD_LOGIC_VECTOR(3 downto 0);
           gt, eq, lt : out STD_LOGIC);
end Magnitude_Comparator_4bit;

architecture Behavioral of Magnitude_Comparator_4bit is
begin
    gt <= '1' when a > b else '0';
    eq <= '1' when a = b else '0';
    lt <= '1' when a < b else '0';
end Behavioral;
