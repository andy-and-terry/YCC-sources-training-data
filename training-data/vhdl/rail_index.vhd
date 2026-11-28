library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Rail_Index is
    Port ( pos  : in  UNSIGNED(7 downto 0);
           rail : out UNSIGNED(1 downto 0));
end Rail_Index;

architecture Behavioral of Rail_Index is
    signal m : UNSIGNED(1 downto 0);
begin
    m <= pos(1 downto 0);                       -- pos mod 4 for a 3-rail fence
    rail <= TO_UNSIGNED(1, 2) when m = 3 else m;
end Behavioral;
