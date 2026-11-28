library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Affine_Letter is
    Port ( x : in  INTEGER range 0 to 25;
           y : out INTEGER range 0 to 25);
end Affine_Letter;

architecture Behavioral of Affine_Letter is
begin
    y <= (5 * x + 8) mod 26;
end Behavioral;
