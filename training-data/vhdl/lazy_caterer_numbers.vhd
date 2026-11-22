-- Lazy caterer's sequence: max pieces from n straight cuts, n(n+1)/2 + 1 (simulation-only).
use std.textio.all;

entity lazy_caterer_numbers is
end entity;

architecture sim of lazy_caterer_numbers is
begin
    process
        variable l : line;
    begin
        for n in 0 to 9 loop
            write(l, integer'image(n * (n + 1) / 2 + 1) & " ");
        end loop;
        writeline(output, l);
        wait;
    end process;
end architecture;
