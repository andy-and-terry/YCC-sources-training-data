-- Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!  (row n = 5, simulation-only).
use std.textio.all;

entity lah_numbers is
end entity;

architecture sim of lah_numbers is
    function fact(m : natural) return natural is
        variable f : natural := 1;
    begin
        for i in 2 to m loop
            f := f * i;
        end loop;
        return f;
    end function;

    function comb(m, j : natural) return natural is
    begin
        return fact(m) / (fact(j) * fact(m - j));
    end function;
begin
    process
        variable l : line;
    begin
        for k in 1 to 5 loop
            write(l, integer'image(comb(4, k - 1) * fact(5) / fact(k)) & " ");
        end loop;
        writeline(output, l);
        wait;
    end process;
end architecture;
