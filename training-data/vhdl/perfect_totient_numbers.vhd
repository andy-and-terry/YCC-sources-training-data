-- Perfect totient numbers: sum of the iterated totient chain down to 1 equals n.
entity perfect_totient_numbers is
end entity;

architecture sim of perfect_totient_numbers is
    function gcd(a0, b0 : natural) return natural is
        variable a : natural := a0;
        variable b : natural := b0;
        variable t : natural;
    begin
        while b /= 0 loop
            t := a mod b;
            a := b;
            b := t;
        end loop;
        return a;
    end function;

    function phi(n : natural) return natural is
        variable c : natural := 0;
    begin
        for k in 1 to n loop
            if gcd(k, n) = 1 then
                c := c + 1;
            end if;
        end loop;
        return c;
    end function;

    function chain_sum(n : natural) return natural is
        variable m     : natural := n;
        variable total : natural := 0;
    begin
        while m > 1 loop
            m := phi(m);
            total := total + m;
        end loop;
        return total;
    end function;
begin
    process
    begin
        for n in 2 to 199 loop
            if chain_sum(n) = n then
                report integer'image(n);
            end if;
        end loop;
        wait;
    end process;
end architecture;
