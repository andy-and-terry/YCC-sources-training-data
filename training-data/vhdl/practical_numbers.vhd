-- Practical numbers: every m in 1..n is a sum of distinct divisors of n (simulation-only).
use std.textio.all;

entity practical_numbers is
end entity;

architecture sim of practical_numbers is
    type flags is array (natural range <>) of boolean;

    function is_practical(n : positive) return boolean is
        variable reach : flags(0 to n) := (0 => true, others => false);
    begin
        for d in 1 to n loop
            if n mod d = 0 then
                for i in n downto d loop
                    if reach(i - d) then reach(i) := true; end if;
                end loop;
            end if;
        end loop;
        for m in 1 to n loop
            if not reach(m) then return false; end if;
        end loop;
        return true;
    end function;
begin
    process
        variable l : line;
    begin
        for n in 1 to 40 loop
            if is_practical(n) then
                write(l, integer'image(n) & " ");
            end if;
        end loop;
        writeline(output, l);
        wait;
    end process;
end architecture;
