-- Number of Roman symbols needed for a single decimal digit (0..9):
-- 0->0, 1->I, 2->II, 3->III, 4->IV, 5->V, 6->VI, 7->VII, 8->VIII, 9->IX
library ieee;
use ieee.std_logic_1164.all;

entity roman_digit_length is
  port (
    digit   : in  natural range 0 to 9;
    symbols : out natural range 0 to 4
  );
end entity;

architecture comb of roman_digit_length is
  type len_table is array (0 to 9) of natural range 0 to 4;
  constant LENGTHS : len_table := (0, 1, 2, 3, 2, 1, 2, 3, 4, 2);
begin
  symbols <= LENGTHS(digit);
end architecture;
