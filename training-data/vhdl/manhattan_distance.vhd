library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Manhattan distance of two 2-D points with unsigned coordinates.
entity Manhattan_Distance is
    Port ( x1, y1, x2, y2 : in  UNSIGNED(7 downto 0);
           dist           : out UNSIGNED(8 downto 0));
end Manhattan_Distance;

architecture Behavioral of Manhattan_Distance is
    function absdiff(a, b : UNSIGNED) return UNSIGNED is
    begin
        if a >= b then return a - b; else return b - a; end if;
    end function;
begin
    dist <= resize(absdiff(x1, x2), 9) + resize(absdiff(y1, y2), 9);
end Behavioral;
