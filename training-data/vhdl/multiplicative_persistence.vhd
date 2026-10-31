library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

entity multiplicative_persistence is
end entity multiplicative_persistence;

architecture sim of multiplicative_persistence is
    function persistence(value : natural) return natural is
        variable n : natural := value;
        variable steps : natural := 0;
        variable product : natural;
    begin
        while n >= 10 loop
            product := 1;
            while n > 0 loop
                product := product * (n mod 10);
                n := n / 10;
            end loop;
            n := product;
            steps := steps + 1;
        end loop;
        return steps;
    end function;
begin
    process
        variable l : line;
    begin
        write(l, string'("39 ")); write(l, persistence(39)); writeline(output, l);
        write(l, string'("77 ")); write(l, persistence(77)); writeline(output, l);
        write(l, string'("999 ")); write(l, persistence(999)); writeline(output, l);
        write(l, string'("10 ")); write(l, persistence(10)); writeline(output, l);
        wait;
    end process;
end architecture sim;
