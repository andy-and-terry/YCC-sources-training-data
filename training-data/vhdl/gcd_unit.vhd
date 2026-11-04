library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity gcd_unit is
  generic (W : positive := 16);
  port (
    clk, rst, start : in  std_logic;
    a_in, b_in      : in  unsigned(W-1 downto 0);
    result          : out unsigned(W-1 downto 0);
    done            : out std_logic);
end entity;

architecture rtl of gcd_unit is
  signal a, b : unsigned(W-1 downto 0);
  signal busy : std_logic := '0';
begin
  process (clk)
  begin
    if rising_edge(clk) then
      done <= '0';
      if rst = '1' then
        busy <= '0';
      elsif start = '1' and busy = '0' then
        a <= a_in; b <= b_in; busy <= '1';
      elsif busy = '1' then
        if b = 0 then
          result <= a; done <= '1'; busy <= '0';
        else
          a <= b; b <= a mod b;
        end if;
      end if;
    end if;
  end process;
end architecture;
