library ieee;
use ieee.std_logic_1164.all;

entity d_flipflop_ex is
  port (clk, rst, d : in std_logic; q : out std_logic);
end entity;

architecture rtl of d_flipflop_ex is
begin
  process (clk, rst)
  begin
    if rst = '1' then
      q <= '0';
    elsif rising_edge(clk) then
      q <= d;
    end if;
  end process;
end architecture;
