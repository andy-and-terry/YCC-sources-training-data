library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity popcount_tree is
  port (x     : in std_logic_vector(7 downto 0);
        count : out unsigned(3 downto 0));
end entity;

architecture rtl of popcount_tree is
begin
  process (x)
    variable n : natural;
  begin
    n := 0;
    for i in x'range loop
      if x(i) = '1' then n := n + 1; end if;
    end loop;
    count <= to_unsigned(n, 4);
  end process;
end architecture;
