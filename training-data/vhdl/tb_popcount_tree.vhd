library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_popcount_tree is end entity;

architecture sim of tb_popcount_tree is
  signal x : std_logic_vector(7 downto 0) := (others => '0');
  signal c : unsigned(3 downto 0);
begin
  dut : entity work.popcount_tree port map (x => x, count => c);

  process
  begin
    x <= "10110111"; wait for 10 ns;
    assert c = 6 report "expected 6" severity error;
    x <= "00000000"; wait for 10 ns;
    assert c = 0 report "expected 0" severity error;
    wait;
  end process;
end architecture;
