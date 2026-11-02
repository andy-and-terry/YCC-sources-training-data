library ieee;
use ieee.std_logic_1164.all;

entity reg_x2 is
  generic (W : positive := 8);
  port (clk, en : in std_logic; d : in std_logic_vector(W-1 downto 0); q : out std_logic_vector(W-1 downto 0));
end entity;

architecture rtl of reg_x2 is
begin
  process (clk) begin
    if rising_edge(clk) and en = '1' then q <= d; end if;
  end process;
end architecture;
