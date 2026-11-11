-- Collatz (hailstone) FSM that tracks the highest value reached
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity hailstone_peak_fsm is
  port (
    clk, rst, start : in  std_logic;
    n_in            : in  unsigned(31 downto 0);
    peak            : out unsigned(31 downto 0);
    done            : out std_logic
  );
end entity;

architecture rtl of hailstone_peak_fsm is
  signal n, best : unsigned(31 downto 0) := (others => '0');
  signal running : std_logic := '0';
  signal finished : std_logic := '0';
begin
  process (clk)
    variable nxt : unsigned(31 downto 0);
  begin
    if rising_edge(clk) then
      if rst = '1' then
        running <= '0'; finished <= '0'; n <= (others => '0'); best <= (others => '0');
      elsif start = '1' and running = '0' then
        n <= n_in; best <= n_in; running <= '1'; finished <= '0';
      elsif running = '1' then
        if n = 1 then
          running <= '0'; finished <= '1';
        else
          if n(0) = '1' then
            nxt := resize(n * 3, 32) + 1;
          else
            nxt := shift_right(n, 1);
          end if;
          n <= nxt;
          if nxt > best then best <= nxt; end if;
        end if;
      end if;
    end if;
  end process;

  peak <= best;
  done <= finished;
end architecture;
