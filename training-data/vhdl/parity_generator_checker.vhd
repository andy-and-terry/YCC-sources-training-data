library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Parity_Generator is
    Port ( data       : in  STD_LOGIC_VECTOR(7 downto 0);
           parity_bit : out STD_LOGIC);
end Parity_Generator;

architecture Behavioral of Parity_Generator is
begin
    parity_bit <= data(0) xor data(1) xor data(2) xor data(3) xor
                  data(4) xor data(5) xor data(6) xor data(7);
end Behavioral;
