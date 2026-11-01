library ieee;
use ieee.std_logic_1164.all;

entity generate_and_chain_ex is
  generic (N : natural := 4);
  port (a : in std_logic_vector(N-1 downto 0); y : out std_logic);
end entity;

architecture rtl of generate_and_chain_ex is
  signal c : std_logic_vector(N downto 0);
begin
  c(0) <= '1';
  g : for i in 0 to N-1 generate
    c(i+1) <= c(i) and a(i);
  end generate;
  y <= c(N);
end architecture;
