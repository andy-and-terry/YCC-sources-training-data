library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

entity powerful_numbers is
end entity powerful_numbers;

architecture sim of powerful_numbers is
    function is_powerful(value : natural) return boolean is
        variable n : natural := value;
        variable p : natural := 2;
    begin
        while p * p <= n loop
            if n mod p = 0 then
                if n mod (p * p) /= 0 then
                    return false;
                end if;
                while n mod p = 0 loop
                    n := n / p;
                end loop;
            end if;
            p := p + 1;
        end loop;
        return n = 1;
    end function;
begin
    process
        variable l : line;
    begin
        for n in 1 to 100 loop
            if is_powerful(n) then
                write(l, n); writeline(output, l);
            end if;
        end loop;
        wait;
    end process;
end architecture sim;
