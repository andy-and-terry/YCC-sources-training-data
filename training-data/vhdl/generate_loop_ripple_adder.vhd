library ieee;
use ieee.std_logic_1164.all;

entity ripple is
  port (a, b : in std_logic_vector(3 downto 0); s : out std_logic_vector(4 downto 0));
end entity;

architecture rtl of ripple is
  signal c : std_logic_vector(4 downto 0);
begin
  c(0) <= '0';
  g : for i in 0 to 3 generate
    s(i)   <= a(i) xor b(i) xor c(i);
    c(i+1) <= (a(i) and b(i)) or (c(i) and (a(i) xor b(i)));
  end generate;
  s(4) <= c(4);
end architecture;
