library ieee;
use ieee.std_logic_1164.all;

entity fsm is
  port (clk, rst, go : in std_logic; busy : out std_logic);
end entity;

architecture rtl of fsm is
  type state_t is (IDLE, RUN, DONE);
  signal s, ns : state_t := IDLE;
begin
  process (clk) begin
    if rising_edge(clk) then
      if rst = '1' then s <= IDLE; else s <= ns; end if;
    end if;
  end process;
  process (s, go) begin
    ns <= s;
    case s is
      when IDLE => if go = '1' then ns <= RUN; end if;
      when RUN  => ns <= DONE;
      when DONE => ns <= IDLE;
    end case;
  end process;
  busy <= '1' when s = RUN else '0';
end architecture;
