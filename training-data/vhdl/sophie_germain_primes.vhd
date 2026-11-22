-- Sophie Germain primes: p prime and 2p + 1 prime (simulation-only).
use std.textio.all;

entity sophie_germain_primes is
end entity;

architecture sim of sophie_germain_primes is
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
begin
    process
        variable l : line;
    begin
        for p in 2 to 99 loop
            if is_prime(p) and is_prime(2 * p + 1) then
                write(l, integer'image(p) & " ");
            end if;
        end loop;
        writeline(output, l);
        wait;
    end process;
end architecture;
