library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Full_Subtractor is
    Port ( a, b, bin  : in  STD_LOGIC;
           diff, bout : out STD_LOGIC);
end Full_Subtractor;

architecture Behavioral of Full_Subtractor is
begin
    diff <= a xor b xor bin;
    bout <= (not a and b) or (not a and bin) or (b and bin);
end Behavioral;
