library ieee;
use ieee.std_logic_1164.all;

entity shreg is
  port (clk, d : in std_logic; q : out std_logic_vector(3 downto 0));
end entity;

architecture rtl of shreg is
  signal r : std_logic_vector(3 downto 0) := (others => '0');
begin
  process (clk) begin
    if rising_edge(clk) then
      r <= r(2 downto 0) & d;
    end if;
  end process;
  q <= r;
end architecture;
