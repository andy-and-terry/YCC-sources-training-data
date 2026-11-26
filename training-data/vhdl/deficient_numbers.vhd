-- Deficient numbers below 100; expect 76. (simulation-only)
entity deficient_numbers is
end entity;

architecture sim of deficient_numbers is
    function proper_sum(n : integer) return integer is
        variable t : integer := 0;
    begin
        for d in 1 to n - 1 loop
            if n mod d = 0 then t := t + d; end if;
        end loop;
        return t;
    end function;
begin
    process
        variable c : integer := 0;
    begin
        for n in 1 to 99 loop
            if proper_sum(n) < n then c := c + 1; end if;
        end loop;
        report integer'image(c);
        wait;
    end process;
end architecture;
