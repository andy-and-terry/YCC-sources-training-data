-- Euler zigzag numbers via the Seidel-Entringer boustrophedon (simulation-only).
use std.textio.all;

entity euler_zigzag_numbers is
end entity;

architecture sim of euler_zigzag_numbers is
    type vec is array (0 to 15) of integer;
begin
    process
        variable l    : line;
        variable row  : vec := (others => 0);
        variable nxt  : vec := (others => 0);
        variable len  : natural := 1;
    begin
        row(0) := 1;
        write(l, string'("1 "));
        for i in 1 to 9 loop
            nxt(0) := 0;
            for j in 1 to len loop
                nxt(j) := nxt(j - 1) + row(len - j);
            end loop;
            len := len + 1;
            row := nxt;
            write(l, integer'image(row(len - 1)) & " ");
        end loop;
        writeline(output, l);
        wait;
    end process;
end architecture;
