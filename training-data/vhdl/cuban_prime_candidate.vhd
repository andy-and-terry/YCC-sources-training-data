library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cuban_prime_candidate is
    port (
        y : in  natural range 0 to 100;
        p : out natural range 0 to 40000
    );
end cuban_prime_candidate;

architecture Behavioral of cuban_prime_candidate is
begin
    p <= 3 * y * y + 3 * y + 1;
end Behavioral;
