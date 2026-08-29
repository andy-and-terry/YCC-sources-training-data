library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package Utility_Pkg is
    function max_of_two(a, b : integer) return integer;
end Utility_Pkg;

package body Utility_Pkg is
    function max_of_two(a, b : integer) return integer is
    begin
        if a > b then
            return a;
        else
            return b;
        end if;
    end function;
end Utility_Pkg;
