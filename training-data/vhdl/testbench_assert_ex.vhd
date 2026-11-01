library ieee;
use ieee.std_logic_1164.all;

entity tb_assert_ex is end entity;

architecture sim of tb_assert_ex is
  signal a, b, s : std_logic;
begin
  s <= a xor b;
  process
  begin
    a <= '1'; b <= '0'; wait for 10 ns;
    assert s = '1' report "xor failed" severity error;
    a <= '1'; b <= '1'; wait for 10 ns;
    assert s = '0' report "xor failed" severity error;
    report "done";
    wait;
  end process;
end architecture;
