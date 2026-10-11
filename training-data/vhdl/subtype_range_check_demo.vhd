library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Subtypes with ranges: simulation raises an error on out-of-range assignment.
entity Subtype_Range_Demo is
end Subtype_Range_Demo;

architecture Sim of Subtype_Range_Demo is
    subtype percent_t is integer range 0 to 100;
    subtype small_nat is natural range 0 to 9;
begin
    process
        variable p : percent_t := 95;
        variable d : small_nat := 0;
    begin
        for i in 1 to 3 loop
            p := p + 2;
            d := d + 3;
            report "p=" & integer'image(p) & " d=" & integer'image(d);
        end loop;
        wait;
    end process;
end Sim;
