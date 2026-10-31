library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

entity alternating_digit_sum is
end entity alternating_digit_sum;

architecture sim of alternating_digit_sum is
    function alternating_digit_sum(value : natural) return integer is
        variable n : natural := value;
        variable total : integer := 0;
        variable sign : integer := 1;
    begin
        while n > 0 loop
            total := total + sign * (n mod 10);
            sign := -sign;
            n := n / 10;
        end loop;
        return total;
    end function;
begin
    process
        variable l : line;
    begin
        write(l, string'("1234 ")); write(l, alternating_digit_sum(1234)); writeline(output, l);
        write(l, string'("99999 ")); write(l, alternating_digit_sum(99999)); writeline(output, l);
        write(l, string'("1000 ")); write(l, alternating_digit_sum(1000)); writeline(output, l);
        wait;
    end process;
end architecture sim;
