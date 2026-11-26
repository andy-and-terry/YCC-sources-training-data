-- Circular primes below 100 (one- and two-digit rotations); expect 13. (simulation-only)
entity circular_primes is
end entity;

architecture sim of circular_primes is
    function is_prime(n : integer) return boolean is
        variable d : integer := 2;
    begin
        if n < 2 then return false; end if;
        while d * d <= n loop
            if n mod d = 0 then return false; end if;
            d := d + 1;
        end loop;
        return true;
    end function;
begin
    process
        variable c : integer := 0;
    begin
        for n in 2 to 99 loop
            if n < 10 then
                if is_prime(n) then c := c + 1; end if;
            elsif is_prime(n) and is_prime((n mod 10) * 10 + n / 10) then
                c := c + 1;
            end if;
        end loop;
        report integer'image(c);
        wait;
    end process;
end architecture;
