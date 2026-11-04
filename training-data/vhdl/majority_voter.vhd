library ieee;
use ieee.std_logic_1164.all;

entity majority_voter is
  port (a, b, c : in std_logic; y : out std_logic);
end entity;

architecture rtl of majority_voter is
begin
  y <= (a and b) or (a and c) or (b and c);
end architecture;
