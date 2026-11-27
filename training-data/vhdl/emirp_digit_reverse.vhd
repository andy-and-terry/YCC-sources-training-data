library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity emirp_digit_reverse is
    port (
        n        : in  natural range 0 to 99;
        reversed : out natural range 0 to 99
    );
end emirp_digit_reverse;

architecture Behavioral of emirp_digit_reverse is
begin
    reversed <= (n mod 10) * 10 + (n / 10);
end Behavioral;
