library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Primality lookup for 4-bit numbers using a selected signal assignment.
entity Small_Prime_Check is
    Port ( n : in UNSIGNED(3 downto 0); is_prime : out STD_LOGIC);
end Small_Prime_Check;

architecture Dataflow of Small_Prime_Check is
begin
    with to_integer(n) select
        is_prime <= '1' when 2 | 3 | 5 | 7 | 11 | 13,
                    '0' when others;
end Dataflow;
