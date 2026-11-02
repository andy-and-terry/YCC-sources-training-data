library ieee;
use ieee.std_logic_1164.all;

entity light_x2 is
  port (clk, rst : in std_logic; red, grn : out std_logic);
end entity;

architecture rtl of light_x2 is
  type st is (R, G);
  signal s : st := R;
begin
  process (clk) begin
    if rising_edge(clk) then
      if rst = '1' then s <= R; elsif s = R then s <= G; else s <= R; end if;
    end if;
  end process;
  red <= '1' when s = R else '0';
  grn <= '1' when s = G else '0';
end architecture;
