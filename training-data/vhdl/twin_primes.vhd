-- Twin primes below 100; expect 8. (simulation-only)
entity twin_primes is
end entity;

architecture sim of twin_primes is
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
        for p in 2 to 99 loop
            if is_prime(p) and is_prime(p + 2) then c := c + 1; end if;
        end loop;
        report integer'image(c);
        wait;
    end process;
end architecture;
