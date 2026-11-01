library ieee;
use ieee.std_logic_1164.all;

entity half_adder_struct_ex is
  port (a, b : in std_logic; s, c : out std_logic);
end entity;

architecture behav of half_adder_struct_ex is
begin
  s <= a xor b;
  c <= a and b;
end architecture;
