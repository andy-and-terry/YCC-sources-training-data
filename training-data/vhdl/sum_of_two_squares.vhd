-- Positive n expressible as a*a + b*b with a, b >= 0.
entity sum_of_two_squares is
end entity;

architecture sim of sum_of_two_squares is
    function representable(n : natural) return boolean is
    begin
        for a in 0 to n loop
            exit when a * a > n;
            for b in a to n loop
                exit when a * a + b * b > n;
                if a * a + b * b = n then
                    return true;
                end if;
            end loop;
        end loop;
        return false;
    end function;
begin
    process
    begin
        for n in 1 to 30 loop
            if representable(n) then
                report "sum of two squares: " & integer'image(n);
            end if;
        end loop;
        wait;
    end process;
end architecture;
