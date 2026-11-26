-- Primorials up to 1e6, including 1; expect 8. (simulation-only)
entity primorial_numbers is
end entity;

architecture sim of primorial_numbers is
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
        variable c   : integer := 1;
        variable acc : integer := 1;
        variable p   : integer;
    begin
        p := 2;
        loop
            if is_prime(p) then
                exit when acc * p > 1000000;
                acc := acc * p;
                c := c + 1;
            end if;
            p := p + 1;
        end loop;
        report integer'image(c);
        wait;
    end process;
end architecture;
