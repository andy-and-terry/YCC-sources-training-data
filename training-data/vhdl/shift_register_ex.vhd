library ieee;
use ieee.std_logic_1164.all;

entity shift_register_ex is
  port (clk, din : in std_logic; q : out std_logic_vector(7 downto 0));
end entity;

architecture rtl of shift_register_ex is
  signal r : std_logic_vector(7 downto 0) := (others => '0');
begin
  process (clk)
  begin
    if rising_edge(clk) then
      r <= r(6 downto 0) & din;
    end if;
  end process;
  q <= r;
end architecture;
