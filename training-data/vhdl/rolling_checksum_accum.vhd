library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rolling_checksum_accum is
  port (clk, rst, valid : in std_logic;
        data            : in unsigned(7 downto 0);
        sum             : out unsigned(15 downto 0));
end entity;

architecture rtl of rolling_checksum_accum is
  signal acc : unsigned(15 downto 0) := (others => '0');
begin
  process (clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        acc <= (others => '0');
      elsif valid = '1' then
        acc <= resize(acc * 31 + data, 16);
      end if;
    end if;
  end process;
  sum <= acc;
end architecture;
