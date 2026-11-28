library ieee;
use ieee.std_logic_1164.all;

entity sierpinski_rule90 is
  port (clk, rst : in std_logic;
        cells    : out std_logic_vector(15 downto 0));
end entity;

architecture rtl of sierpinski_rule90 is
  signal c : std_logic_vector(15 downto 0) := x"0100";
begin
  process (clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        c <= x"0100";
      else
        c <= (c(14 downto 0) & c(15)) xor (c(0) & c(15 downto 1));
      end if;
    end if;
  end process;
  cells <= c;
end architecture;
