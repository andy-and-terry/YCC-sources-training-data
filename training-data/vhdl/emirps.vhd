-- Emirps below 200; expect 15. (simulation-only)
entity emirps is
end entity;

architecture sim of emirps is
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
    function rev(n : integer) return integer is
        variable m : integer := n;
        variable r : integer := 0;
    begin
        while m > 0 loop
            r := r * 10 + m mod 10;
            m := m / 10;
        end loop;
        return r;
    end function;
begin
    process
        variable c : integer := 0;
    begin
        for n in 2 to 199 loop
            if rev(n) /= n and is_prime(n) and is_prime(rev(n)) then c := c + 1; end if;
        end loop;
        report integer'image(c);
        wait;
    end process;
end architecture;
