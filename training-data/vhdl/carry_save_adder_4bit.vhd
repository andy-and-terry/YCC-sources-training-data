library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Carry_Save_Adder_4bit is
    Port ( a, b, c    : in  STD_LOGIC_VECTOR(3 downto 0);
           sum, carry : out STD_LOGIC_VECTOR(3 downto 0));
end Carry_Save_Adder_4bit;

architecture Behavioral of Carry_Save_Adder_4bit is
begin
    sum   <= a xor b xor c;
    carry <= (a and b) or (b and c) or (a and c);
end Behavioral;
