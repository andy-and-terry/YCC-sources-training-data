-- Amicable pairs below 1500 via sums of proper divisors (simulation-only).
entity amicable_pairs is
end entity;

architecture sim of amicable_pairs is
    function s(n : natural) return natural is
        variable t : natural := 0;
    begin
        for d in 1 to n - 1 loop
            if n mod d = 0 then
                t := t + d;
            end if;
        end loop;
        return t;
    end function;
begin
    process
        variable b : natural;
    begin
        for a in 2 to 1499 loop
            b := s(a);
            if b > a and s(b) = a then
                report integer'image(a) & " " & integer'image(b);
            end if;
        end loop;
        wait;
    end process;
end architecture;
