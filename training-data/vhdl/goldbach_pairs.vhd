-- Goldbach partitions of 100; expect 6. (simulation-only)
entity goldbach_pairs is
end entity;

architecture sim of goldbach_pairs is
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
        for p in 2 to 50 loop
            if is_prime(p) and is_prime(100 - p) then c := c + 1; end if;
        end loop;
        report integer'image(c);
        wait;
    end process;
end architecture;
