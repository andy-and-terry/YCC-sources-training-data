library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

entity factorion_check is
end entity factorion_check;

architecture sim of factorion_check is
    type fact_table is array (0 to 9) of natural;
    constant fact : fact_table := (1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880);

    function is_factorion(n : natural) return boolean is
        variable m : natural := n;
        variable total : natural := 0;
    begin
        while m > 0 loop
            total := total + fact(m mod 10);
            m := m / 10;
        end loop;
        return total = n;
    end function;
begin
    process
        variable l : line;
    begin
        for n in 1 to 49999 loop
            if is_factorion(n) then
                write(l, n); writeline(output, l);
            end if;
        end loop;
        wait;
    end process;
end architecture sim;
