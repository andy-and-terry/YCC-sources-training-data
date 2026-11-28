library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity binary_gcd_fsm is
  port (clk, rst, start : in std_logic;
        a_in, b_in      : in unsigned(15 downto 0);
        result          : out unsigned(15 downto 0);
        done            : out std_logic);
end entity;

architecture rtl of binary_gcd_fsm is
  type state_t is (idle, run, fin);
  signal state : state_t := idle;
  signal a, b  : unsigned(15 downto 0);
begin
  process (clk)
  begin
    if rising_edge(clk) then
      done <= '0';
      if rst = '1' then
        state <= idle;
      else
        case state is
          when idle =>
            if start = '1' then a <= a_in; b <= b_in; state <= run; end if;
          when run =>
            if a = b or a = 0 or b = 0 then state <= fin;
            elsif a > b then a <= a - b;
            else b <= b - a;
            end if;
          when fin =>
            result <= a or b;
            done <= '1';
            state <= idle;
        end case;
      end if;
    end if;
  end process;
end architecture;
