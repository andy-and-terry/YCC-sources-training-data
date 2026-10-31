library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

entity semiprime_check is
end entity semiprime_check;

architecture sim of semiprime_check is
    function prime_factor_count(value : natural) return natural is
        variable n : natural := value;
        variable p : natural := 2;
        variable count : natural := 0;
    begin
        while p * p <= n loop
            while n mod p = 0 loop
                n := n / p;
                count := count + 1;
            end loop;
            p := p + 1;
        end loop;
        if n > 1 then
            count := count + 1;
        end if;
        return count;
    end function;
begin
    process
        variable l : line;
    begin
        for n in 2 to 29 loop
            if prime_factor_count(n) = 2 then
                write(l, n); writeline(output, l);
            end if;
        end loop;
        wait;
    end process;
end architecture sim;
