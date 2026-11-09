library ieee;
use ieee.std_logic_1164.all;

entity parity is
  port (d : in std_logic_vector(7 downto 0); p : out std_logic);
end entity;

architecture rtl of parity is
  signal t : std_logic_vector(8 downto 0);
begin
  t(0) <= '0';
  g : for i in 0 to 7 generate
    t(i+1) <= t(i) xor d(i);
  end generate;
  p <= t(8);
end architecture;
