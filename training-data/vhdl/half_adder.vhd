library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Half_Adder is
    Port ( a, b     : in  STD_LOGIC;
           sum, carry : out STD_LOGIC);
end Half_Adder;

architecture Behavioral of Half_Adder is
begin
    sum   <= a xor b;
    carry <= a and b;
end Behavioral;
