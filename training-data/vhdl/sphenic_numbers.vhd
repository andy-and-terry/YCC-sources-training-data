library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

entity sphenic_numbers is
end entity sphenic_numbers;

architecture sim of sphenic_numbers is
    function is_sphenic(value : natural) return boolean is
        variable n : natural := value;
        variable p : natural := 2;
        variable distinct : natural := 0;
    begin
        while p * p <= n loop
            if n mod p = 0 then
                n := n / p;
                if n mod p = 0 then
                    return false;
                end if;
                distinct := distinct + 1;
            end if;
            p := p + 1;
        end loop;
        if n > 1 then
            distinct := distinct + 1;
        end if;
        return distinct = 3;
    end function;
begin
    process
        variable l : line;
    begin
        for n in 2 to 79 loop
            if is_sphenic(n) then
                write(l, n); writeline(output, l);
            end if;
        end loop;
        wait;
    end process;
end architecture sim;
