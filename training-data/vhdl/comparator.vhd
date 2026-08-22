library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Comparator is
    Port ( a, b : in  UNSIGNED(3 downto 0);
           eq, gt, lt : out STD_LOGIC);
end Comparator;

architecture Behavioral of Comparator is
begin
    eq <= '1' when a = b else '0';
    gt <= '1' when a > b else '0';
    lt <= '1' when a < b else '0';
end Behavioral;
