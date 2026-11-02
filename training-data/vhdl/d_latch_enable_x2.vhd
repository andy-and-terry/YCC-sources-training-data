library ieee;
use ieee.std_logic_1164.all;

entity latch_x2 is
  port (en, d : in std_logic; q : out std_logic);
end entity;

architecture rtl of latch_x2 is
begin
  process (en, d) begin
    if en = '1' then q <= d; end if;
  end process;
end architecture;
