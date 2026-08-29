library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Gray_To_Binary is
    Port ( gray   : in  STD_LOGIC_VECTOR(3 downto 0);
           binary : out STD_LOGIC_VECTOR(3 downto 0));
end Gray_To_Binary;

architecture Behavioral of Gray_To_Binary is
    signal binary_internal : STD_LOGIC_VECTOR(3 downto 0);
begin
    binary_internal(3) <= gray(3);
    binary_internal(2) <= binary_internal(3) xor gray(2);
    binary_internal(1) <= binary_internal(2) xor gray(1);
    binary_internal(0) <= binary_internal(1) xor gray(0);
    binary <= binary_internal;
end Behavioral;
