library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity triangular_numbers is
  port (
    clk, rst : in  std_logic;
    tri      : out unsigned(15 downto 0)
  );
end entity;

architecture rtl of triangular_numbers is
  signal n   : unsigned(7 downto 0)  := (others => '0');
  signal acc : unsigned(15 downto 0) := (others => '0');
begin
  process (clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        n <= (others => '0');
        acc <= (others => '0');
      else
        n <= n + 1;
        acc <= acc + resize(n + 1, 16);
      end if;
    end if;
  end process;
  tri <= acc;
end architecture;
