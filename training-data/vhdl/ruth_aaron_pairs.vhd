-- Consecutive n, n+1 with equal sums of prime factors (with multiplicity).
entity ruth_aaron_pairs is
end entity;

architecture sim of ruth_aaron_pairs is
    function sopfr(start : positive) return natural is
        variable m     : positive := start;
        variable p     : positive := 2;
        variable total : natural := 0;
    begin
        while p * p <= m loop
            while m mod p = 0 loop
                total := total + p;
                m := m / p;
            end loop;
            p := p + 1;
        end loop;
        if m > 1 then
            total := total + m;
        end if;
        return total;
    end function;
begin
    process
    begin
        for n in 2 to 109 loop
            if sopfr(n) = sopfr(n + 1) then
                report "ruth-aaron pair starts at " & integer'image(n);
            end if;
        end loop;
        wait;
    end process;
end architecture;
