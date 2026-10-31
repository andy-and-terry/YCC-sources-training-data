library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

entity self_describing_numbers is
end entity self_describing_numbers;

architecture sim of self_describing_numbers is
    function is_self_describing(s : string) return boolean is
        variable count : natural;
    begin
        for i in 0 to s'length - 1 loop
            count := 0;
            for j in s'range loop
                if character'pos(s(j)) - character'pos('0') = i then
                    count := count + 1;
                end if;
            end loop;
            if count /= character'pos(s(s'left + i)) - character'pos('0') then
                return false;
            end if;
        end loop;
        return true;
    end function;
begin
    process
        variable l : line;
    begin
        write(l, string'("1210 ")); write(l, is_self_describing("1210")); writeline(output, l);
        write(l, string'("2020 ")); write(l, is_self_describing("2020")); writeline(output, l);
        write(l, string'("21200 ")); write(l, is_self_describing("21200")); writeline(output, l);
        write(l, string'("1211 ")); write(l, is_self_describing("1211")); writeline(output, l);
        wait;
    end process;
end architecture sim;
