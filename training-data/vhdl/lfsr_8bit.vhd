library ieee;
use ieee.std_logic_1164.all;

entity lfsr_8bit is
  port (clk, rst : in std_logic; q : out std_logic_vector(7 downto 0));
end entity;

architecture rtl of lfsr_8bit is
  signal r : std_logic_vector(7 downto 0) := x"01";
begin
  process (clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        r <= x"01";
      else
        r <= r(6 downto 0) & (r(7) xor r(5) xor r(4) xor r(3));
      end if;
    end if;
  end process;
  q <= r;
end architecture;
