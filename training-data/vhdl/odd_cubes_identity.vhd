library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

entity odd_cubes_identity is
end entity odd_cubes_identity;

architecture sim of odd_cubes_identity is
    function cube_from_odds(n : natural) return natural is
        variable start : natural := n * n - n + 1;
        variable total : natural := 0;
    begin
        for i in 0 to n - 1 loop
            total := total + start + 2 * i;
        end loop;
        return total;
    end function;
begin
    process
        variable l : line;
    begin
        for n in 1 to 5 loop
            write(l, n); write(l, string'(" ")); write(l, cube_from_odds(n));
            write(l, string'(" ")); write(l, cube_from_odds(n) = n * n * n);
            writeline(output, l);
        end loop;
        wait;
    end process;
end architecture sim;
