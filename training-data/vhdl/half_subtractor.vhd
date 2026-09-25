library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Half_Subtractor is
    Port ( a, b       : in  STD_LOGIC;
           diff, bout : out STD_LOGIC);
end Half_Subtractor;

architecture Behavioral of Half_Subtractor is
begin
    diff <= a xor b;
    bout <= (not a) and b;
end Behavioral;
