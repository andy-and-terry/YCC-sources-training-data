library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Inverter is
    Port ( a : in STD_LOGIC; y : out STD_LOGIC);
end Inverter;

architecture Fast of Inverter is
begin
    y <= not a;
end Fast;

architecture Slow of Inverter is
begin
    y <= not a after 5 ns;
end Slow;

-- A configuration selects which architecture is bound to the entity.
configuration Inverter_Slow_Cfg of Inverter is
    for Slow
    end for;
end Inverter_Slow_Cfg;
