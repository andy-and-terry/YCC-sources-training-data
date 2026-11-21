-- Carmichael numbers via Korselt's criterion: n is squarefree, composite,
-- and p - 1 divides n - 1 for every prime factor p.
entity carmichael_numbers is
end entity;

architecture sim of carmichael_numbers is
    function is_carmichael(n : natural) return boolean is
        variable m     : natural := n;
        variable p     : natural := 2;
        variable count : natural := 0;
    begin
        while p * p <= m loop
            if m mod p = 0 then
                m := m / p;
                if m mod p = 0 then
                    return false;              -- not squarefree
                end if;
                if (n - 1) mod (p - 1) /= 0 then
                    return false;
                end if;
                count := count + 1;
            end if;
            p := p + 1;
        end loop;
        if m > 1 then
            if (n - 1) mod (m - 1) /= 0 then
                return false;
            end if;
            count := count + 1;
        end if;
        return count >= 2;
    end function;
begin
    process
        variable n : natural := 3;
    begin
        while n < 3000 loop
            if is_carmichael(n) then
                report integer'image(n);
            end if;
            n := n + 2;
        end loop;
        wait;
    end process;
end architecture;
