library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package lah_pkg is
    function lah(n, k : positive) return natural;
end package;

package body lah_pkg is
    function lah(n, k : positive) return natural is
        variable c : natural := 1;
        variable f : natural := 1;
    begin
        for i in 0 to k - 2 loop
            c := c * (n - 1 - i) / (i + 1);
        end loop;
        for i in k + 1 to n loop
            f := f * i;
        end loop;
        return c * f;
    end function;
end package body;
