-- Moebius function: 0 if n has a squared prime factor, else (-1)^k.
entity mobius_function is
end entity;

architecture sim of mobius_function is
    function mobius(v : natural) return integer is
        variable m   : natural := v;
        variable p   : natural := 2;
        variable res : integer := 1;
    begin
        while p * p <= m loop
            if m mod p = 0 then
                m := m / p;
                if m mod p = 0 then
                    return 0;
                end if;
                res := -res;
            end if;
            p := p + 1;
        end loop;
        if m > 1 then
            res := -res;
        end if;
        return res;
    end function;
begin
    process
    begin
        for n in 1 to 30 loop
            report "mobius(" & integer'image(n) & ") = " & integer'image(mobius(n));
        end loop;
        wait;
    end process;
end architecture;
