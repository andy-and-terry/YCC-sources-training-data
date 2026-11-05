library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package Parity_Pkg is
    function parity (v : STD_LOGIC_VECTOR) return STD_LOGIC;
end package;

package body Parity_Pkg is
    function parity (v : STD_LOGIC_VECTOR) return STD_LOGIC is
        variable r : STD_LOGIC := '0';
    begin
        for i in v'range loop r := r xor v(i); end loop;
        return r;
    end function;
end package body;
