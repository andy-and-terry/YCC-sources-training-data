library ieee;
use ieee.std_logic_1164.all;

entity fsm_traffic_light_ex is
  port (clk, rst : in std_logic; red, yellow, green : out std_logic);
end entity;

architecture rtl of fsm_traffic_light_ex is
  type state_t is (S_RED, S_GREEN, S_YELLOW);
  signal st : state_t := S_RED;
begin
  process (clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then st <= S_RED;
      else
        case st is
          when S_RED    => st <= S_GREEN;
          when S_GREEN  => st <= S_YELLOW;
          when S_YELLOW => st <= S_RED;
        end case;
      end if;
    end if;
  end process;
  red    <= '1' when st = S_RED    else '0';
  yellow <= '1' when st = S_YELLOW else '0';
  green  <= '1' when st = S_GREEN  else '0';
end architecture;
