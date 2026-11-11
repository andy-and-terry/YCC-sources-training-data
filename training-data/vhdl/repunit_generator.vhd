-- Repunit generator: 1, 11, 111, ... via r <= r*10 + 1 on each enable pulse
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity repunit_generator is
  port (
    clk     : in  std_logic;
    rst     : in  std_logic;
    en      : in  std_logic;
    repunit : out unsigned(31 downto 0)
  );
end entity;

architecture rtl of repunit_generator is
  signal r : unsigned(31 downto 0) := (others => '0');
begin
  process (clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        r <= (others => '0');
      elsif en = '1' then
        r <= resize(r * 10, 32) + 1;
      end if;
    end if;
  end process;

  repunit <= r;
end architecture;
