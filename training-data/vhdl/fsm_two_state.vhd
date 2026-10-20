library ieee;
use ieee.std_logic_1164.all;

entity toggler is
  port (clk, en : in std_logic; led : out std_logic);
end entity;

architecture rtl of toggler is
  type state_t is (OFF, ON);
  signal s : state_t := OFF;
begin
  process (clk) begin
    if rising_edge(clk) and en = '1' then
      if s = OFF then s <= ON; else s <= OFF; end if;
    end if;
  end process;
  led <= '1' when s = ON else '0';
end architecture;
