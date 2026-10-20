library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package util_pkg is
    function parity(v : std_logic_vector) return std_logic;
    function popcount(v : std_logic_vector) return natural;
    function log2ceil(n : positive) return natural;
    constant WIDTH : natural := 8;
end package util_pkg;

package body util_pkg is
    function parity(v : std_logic_vector) return std_logic is
        variable p : std_logic := '0';
    begin
        for i in v'range loop p := p xor v(i); end loop;
        return p;
    end function;

    function popcount(v : std_logic_vector) return natural is
        variable n : natural := 0;
    begin
        for i in v'range loop if v(i) = '1' then n := n + 1; end if; end loop;
        return n;
    end function;

    function log2ceil(n : positive) return natural is
        variable r : natural := 0;
        variable x : natural := 1;
    begin
        while x < n loop x := x * 2; r := r + 1; end loop;
        return r;
    end function;
end package body util_pkg;
