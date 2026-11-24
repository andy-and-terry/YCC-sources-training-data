-- Fibbinary numbers: no two adjacent 1 bits.
library ieee;
use ieee.numeric_std.all;

entity fibbinary_numbers is
end entity;

architecture sim of fibbinary_numbers is
begin
    process
        variable v : unsigned(7 downto 0);
    begin
        for n in 0 to 49 loop
            v := to_unsigned(n, 8);
            if (v and shift_right(v, 1)) = 0 then
                report integer'image(n);
            end if;
        end loop;
        wait;
    end process;
end architecture;
