-- Munchausen numbers: sum of digit^digit equals n (0^0 counted as 0).
entity munchausen_numbers is
end entity;

architecture sim of munchausen_numbers is
    function is_munchausen(n : natural) return boolean is
        variable m     : natural := n;
        variable d, p  : natural;
        variable total : natural := 0;
    begin
        while m > 0 loop
            d := m mod 10;
            if d > 0 then
                p := 1;
                for i in 1 to d loop
                    p := p * d;
                end loop;
                total := total + p;
            end if;
            m := m / 10;
        end loop;
        return total = n;
    end function;
begin
    process
    begin
        for n in 1 to 4999 loop
            if is_munchausen(n) then
                report integer'image(n);
            end if;
        end loop;
        wait;
    end process;
end architecture;
