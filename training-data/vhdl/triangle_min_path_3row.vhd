library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Minimum top-to-bottom path cost through a 3-row triangle.
entity Triangle_Min_Path_3Row is
    Port ( r0              : in  UNSIGNED(7 downto 0);
           r1a, r1b        : in  UNSIGNED(7 downto 0);
           r2a, r2b, r2c   : in  UNSIGNED(7 downto 0);
           best            : out UNSIGNED(9 downto 0));
end Triangle_Min_Path_3Row;

architecture Behavioral of Triangle_Min_Path_3Row is
    signal left_cost, right_cost : UNSIGNED(9 downto 0);
    function min2(x, y : UNSIGNED) return UNSIGNED is
    begin
        if x < y then return x; else return y; end if;
    end function;
begin
    left_cost  <= resize(r1a, 10) + resize(min2(r2a, r2b), 10);
    right_cost <= resize(r1b, 10) + resize(min2(r2b, r2c), 10);
    best <= resize(r0, 10) + min2(left_cost, right_cost);
end Behavioral;
