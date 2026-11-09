library ieee;
use ieee.std_logic_1164.all;

entity reg is
  generic (W : positive := 8);
  port (clk : in std_logic; d : in std_logic_vector(W-1 downto 0); q : out std_logic_vector(W-1 downto 0));
end entity;

architecture rtl of reg is
begin
  process (clk) begin
    if rising_edge(clk) then q <= d; end if;
  end process;
end architecture;
