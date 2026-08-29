library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Binary_To_Gray is
    Port ( binary : in  STD_LOGIC_VECTOR(3 downto 0);
           gray    : out STD_LOGIC_VECTOR(3 downto 0));
end Binary_To_Gray;

architecture Behavioral of Binary_To_Gray is
begin
    gray(3) <= binary(3);
    gray(2) <= binary(3) xor binary(2);
    gray(1) <= binary(2) xor binary(1);
    gray(0) <= binary(1) xor binary(0);
end Behavioral;
