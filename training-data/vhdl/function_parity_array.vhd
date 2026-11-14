library ieee;
use ieee.std_logic_1164.all;

package util is
  function parity (v : std_logic_vector) return std_logic;
end package;

package body util is
  function parity (v : std_logic_vector) return std_logic is
    variable p : std_logic := '0';
  begin
    for i in v'range loop p := p xor v(i); end loop;
    return p;
  end function;
end package body;
