library ieee; use ieee.std_logic_1164.all;
entity fsm is port (clk, rst, go : in std_logic; busy : out std_logic); end;
architecture rtl of fsm is type st is (idle, run, done); signal s : st := idle;
begin
  process (clk) begin
    if rising_edge(clk) then
      if rst = '1' then s <= idle;
      else case s is
        when idle => if go = '1' then s <= run; end if;
        when run => s <= done;
        when done => s <= idle;
      end case; end if;
    end if;
  end process;
  busy <= '1' when s = run else '0';
end;
