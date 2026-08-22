library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Full_Adder is
    Port ( a, b, cin : in  STD_LOGIC;
           sum, cout  : out STD_LOGIC);
end Full_Adder;

architecture Behavioral of Full_Adder is
begin
    sum  <= a xor b xor cin;
    cout <= (a and b) or (cin and (a xor b));
end Behavioral;
