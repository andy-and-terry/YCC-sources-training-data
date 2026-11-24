-- Moser-de Bruijn sequence: binary digits of n read in base 4.
entity moser_de_bruijn is
end entity;

architecture sim of moser_de_bruijn is
    function moser(v : natural) return natural is
        variable m     : natural := v;
        variable place : natural := 1;
        variable res   : natural := 0;
    begin
        while m > 0 loop
            if m mod 2 = 1 then
                res := res + place;
            end if;
            m := m / 2;
            place := place * 4;
        end loop;
        return res;
    end function;
begin
    process
    begin
        for n in 0 to 11 loop
            report integer'image(moser(n));
        end loop;
        wait;
    end process;
end architecture;
