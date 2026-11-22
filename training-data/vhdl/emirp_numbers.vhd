-- Emirps: primes whose digit reversal is a different prime (simulation-only).
use std.textio.all;

entity emirp_numbers is
end entity;

architecture sim of emirp_numbers is
    function is_prime(k : natural) return boolean is
        variable d : natural := 2;
    begin
        if k < 2 then return false; end if;
        while d * d <= k loop
            if k mod d = 0 then return false; end if;
            d := d + 1;
        end loop;
        return true;
    end function;

    function reverse_num(k : natural) return natural is
        variable m : natural := k;
        variable r : natural := 0;
    begin
        while m > 0 loop
            r := r * 10 + m mod 10;
            m := m / 10;
        end loop;
        return r;
    end function;
begin
    process
        variable l : line;
        variable r : natural;
    begin
        for n in 2 to 199 loop
            r := reverse_num(n);
            if r /= n and is_prime(n) and is_prime(r) then
                write(l, integer'image(n) & " ");
            end if;
        end loop;
        writeline(output, l);
        wait;
    end process;
end architecture;
