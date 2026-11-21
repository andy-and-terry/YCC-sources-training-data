-- Disarium numbers: digits raised to their 1-based positions sum to n.
entity disarium_numbers is
end entity;

architecture sim of disarium_numbers is
    function is_disarium(n : natural) return boolean is
        variable m, k, d, p : natural;
        variable total      : natural := 0;
    begin
        k := 0;
        m := n;
        while m > 0 loop
            k := k + 1;
            m := m / 10;
        end loop;
        m := n;
        for pos in k downto 1 loop
            d := m mod 10;
            p := 1;
            for i in 1 to pos loop
                p := p * d;
            end loop;
            total := total + p;
            m := m / 10;
        end loop;
        return total = n;
    end function;
begin
    process
    begin
        for n in 1 to 999 loop
            if is_disarium(n) then
                report integer'image(n);
            end if;
        end loop;
        wait;
    end process;
end architecture;
