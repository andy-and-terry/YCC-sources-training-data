library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pythagorean_triple_checker is
    port (
        a, b, c   : in  unsigned(7 downto 0);
        is_triple : out std_logic
    );
end entity;

architecture rtl of pythagorean_triple_checker is
begin
    is_triple <= '1' when (a * a + b * b) = (c * c) else '0';
end architecture;
