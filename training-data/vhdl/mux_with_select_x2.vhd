library ieee;
use ieee.std_logic_1164.all;

entity mux_x2 is
  port (a, b, c, d : in std_logic; s : in std_logic_vector(1 downto 0); y : out std_logic);
end entity;

architecture rtl of mux_x2 is
begin
  with s select y <= a when "00", b when "01", c when "10", d when others;
end architecture;
