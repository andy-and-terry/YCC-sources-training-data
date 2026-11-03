library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity digit_square_sum is
  port (
    n     : in  natural range 0 to 999;
    total : out natural
  );
end entity;

architecture rtl of digit_square_sum is
begin
  total <= ((n mod 10) ** 2) + (((n / 10) mod 10) ** 2) + ((n / 100) ** 2);
end architecture;
