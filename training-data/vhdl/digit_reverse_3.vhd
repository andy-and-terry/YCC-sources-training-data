-- Reverse the decimal digits of a number in 0..999 (building block of an emirp check)
library ieee;
use ieee.std_logic_1164.all;

entity digit_reverse_3 is
  port (
    n        : in  natural range 0 to 999;
    reversed : out natural range 0 to 999
  );
end entity;

architecture comb of digit_reverse_3 is
begin
  reversed <= (n mod 10) * 100 + ((n / 10) mod 10) * 10 + (n / 100);
end architecture;
