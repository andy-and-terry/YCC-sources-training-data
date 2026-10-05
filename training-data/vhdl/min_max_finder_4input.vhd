library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Min_Max_Finder_4input is
    Generic ( WIDTH : integer := 8 );
    Port ( a, b, c, d : in  UNSIGNED(WIDTH-1 downto 0);
           min_val    : out UNSIGNED(WIDTH-1 downto 0);
           max_val    : out UNSIGNED(WIDTH-1 downto 0));
end Min_Max_Finder_4input;

architecture Behavioral of Min_Max_Finder_4input is
    signal min_ab, min_cd, max_ab, max_cd : UNSIGNED(WIDTH-1 downto 0);
begin
    min_ab <= a when a < b else b;
    min_cd <= c when c < d else d;
    max_ab <= a when a > b else b;
    max_cd <= c when c > d else d;

    min_val <= min_ab when min_ab < min_cd else min_cd;
    max_val <= max_ab when max_ab > max_cd else max_cd;
end Behavioral;
