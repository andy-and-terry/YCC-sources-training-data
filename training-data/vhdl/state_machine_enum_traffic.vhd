library ieee;
use ieee.std_logic_1164.all;

entity traffic is
  port (clk, rst : in std_logic; green, red : out std_logic);
end entity;

architecture fsm of traffic is
  type state_t is (S_RED, S_GREEN);
  signal s : state_t := S_RED;
begin
  process (clk) begin
    if rising_edge(clk) then
      if rst = '1' then s <= S_RED;
      elsif s = S_RED then s <= S_GREEN; else s <= S_RED; end if;
    end if;
  end process;
  green <= '1' when s = S_GREEN else '0';
  red   <= '1' when s = S_RED else '0';
end architecture;
