library ieee;
use ieee.std_logic_1164.all;

entity mux2_when_else_ex is
  port (a, b, sel : in std_logic; y : out std_logic);
end entity;

architecture dataflow of mux2_when_else_ex is
begin
  y <= a when sel = '0' else b;
end architecture;
