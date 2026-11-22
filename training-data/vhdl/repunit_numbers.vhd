-- Repunits: R_k = (10^k - 1) / 9, built as r = 10r + 1 (simulation-only).
-- VHDL integers are 32-bit, so only R_1 .. R_9 fit.
use std.textio.all;

entity repunit_numbers is
end entity;

architecture sim of repunit_numbers is
begin
    process
        variable l : line;
        variable r : integer := 0;
    begin
        for i in 1 to 8 loop
            r := r * 10 + 1;
            write(l, integer'image(r) & " ");
        end loop;
        writeline(output, l);
        wait;
    end process;
end architecture;
