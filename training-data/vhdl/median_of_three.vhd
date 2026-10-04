library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity median_of_three is
    port ( a, b, c : in  unsigned(7 downto 0);
           median  : out unsigned(7 downto 0) );
end median_of_three;

architecture Behavioral of median_of_three is
begin
    process(a, b, c)
    begin
        if (a >= b and b >= c) or (c >= b and b >= a) then
            median <= b;
        elsif (b >= a and a >= c) or (c >= a and a >= b) then
            median <= a;
        else
            median <= c;
        end if;
    end process;
end Behavioral;
