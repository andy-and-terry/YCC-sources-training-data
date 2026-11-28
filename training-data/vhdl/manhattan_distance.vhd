library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Manhattan_Distance is
    Port ( x1, y1, x2, y2 : in  UNSIGNED(3 downto 0);
           dist           : out UNSIGNED(4 downto 0));
end Manhattan_Distance;

architecture Behavioral of Manhattan_Distance is
    signal dx, dy : UNSIGNED(3 downto 0);
begin
    dx <= x1 - x2 when x1 >= x2 else x2 - x1;
    dy <= y1 - y2 when y1 >= y2 else y2 - y1;
    dist <= ('0' & dx) + ('0' & dy);
end Behavioral;
