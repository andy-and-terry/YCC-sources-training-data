library ieee;
use ieee.std_logic_1164.all;

entity mux2 is
  port (a, b, s : in std_logic; y : out std_logic);
end entity;

architecture df of mux2 is begin
  with s select y <= a when '0', b when others;
end architecture;
