library ieee;
use ieee.std_logic_1164.all;

entity tb is end entity;

architecture sim of tb is
  signal a, b, y : std_logic;
begin
  uut : entity work.and_gate port map (a, b, y);
  process begin
    a <= '0'; b <= '0'; wait for 10 ns;
    a <= '1'; b <= '1'; wait for 10 ns;
    assert y = '1' report "AND failed" severity error;
    wait;
  end process;
end architecture;
