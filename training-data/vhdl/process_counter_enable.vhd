library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cnt is
  port (clk, en : in std_logic; q : out unsigned(3 downto 0));
end entity;

architecture rtl of cnt is
  signal r : unsigned(3 downto 0) := (others => '0');
begin
  process (clk) begin
    if rising_edge(clk) and en = '1' then r <= r + 1; end if;
  end process;
  q <= r;
end architecture;
