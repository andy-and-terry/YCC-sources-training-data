library ieee;
use ieee.std_logic_1164.all;

entity mux2to1 is
  generic (W : positive := 8);
  port (a, b : in  std_logic_vector(W-1 downto 0);
        sel  : in  std_logic;
        y    : out std_logic_vector(W-1 downto 0));
end entity;

architecture rtl of mux2to1 is
begin
  y <= b when sel = '1' else a;
end architecture;
