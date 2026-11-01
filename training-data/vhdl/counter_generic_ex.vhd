library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter_generic_ex is
  generic (WIDTH : natural := 8);
  port (clk, rst, en : in std_logic; q : out unsigned(WIDTH-1 downto 0));
end entity;

architecture rtl of counter_generic_ex is
  signal cnt : unsigned(WIDTH-1 downto 0) := (others => '0');
begin
  process (clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then cnt <= (others => '0');
      elsif en = '1' then cnt <= cnt + 1;
      end if;
    end if;
  end process;
  q <= cnt;
end architecture;
