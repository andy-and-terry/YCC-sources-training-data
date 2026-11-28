library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Container area between two bars: min(h1, h2) * distance.
entity Water_Area_Calculator is
    Port ( h1, h2   : in  UNSIGNED(7 downto 0);
           distance : in  UNSIGNED(3 downto 0);
           area     : out UNSIGNED(11 downto 0));
end Water_Area_Calculator;

architecture Behavioral of Water_Area_Calculator is
    signal shorter : UNSIGNED(7 downto 0);
begin
    shorter <= h1 when h1 < h2 else h2;
    area    <= shorter * distance;
end Behavioral;
