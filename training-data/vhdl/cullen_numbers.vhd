library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

entity cullen_numbers is
end entity cullen_numbers;

architecture sim of cullen_numbers is
    function cullen(n : natural) return natural is
    begin
        return n * 2 ** n + 1;
    end function;
begin
    process
        variable l : line;
    begin
        for n in 1 to 5 loop
            write(l, n); write(l, string'(" ")); write(l, cullen(n));
            writeline(output, l);
        end loop;
        wait;
    end process;
end architecture sim;
