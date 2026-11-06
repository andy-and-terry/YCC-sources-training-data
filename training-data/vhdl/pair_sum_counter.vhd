-- Count adjacent pairs in 4 values whose sum equals K
-- (the length-2 case of "subarray sum equals k")
library ieee;
use ieee.std_logic_1164.all;

entity pair_sum_counter is
  generic (K : integer := 2);
  port (
    a0, a1, a2, a3 : in  integer range 0 to 255;
    count          : out natural range 0 to 3
  );
end entity;

architecture comb of pair_sum_counter is
begin
  process (a0, a1, a2, a3)
    variable c : natural range 0 to 3;
  begin
    c := 0;
    if a0 + a1 = K then c := c + 1; end if;
    if a1 + a2 = K then c := c + 1; end if;
    if a2 + a3 = K then c := c + 1; end if;
    count <= c;
  end process;
end architecture;
