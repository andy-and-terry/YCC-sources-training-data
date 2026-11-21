-- Keith numbers: n appears in the Fibonacci-like sequence seeded by its digits.
entity keith_numbers is
end entity;

architecture sim of keith_numbers is
    type int_array is array (0 to 63) of natural;

    function is_keith(n : natural) return boolean is
        variable seq   : int_array;
        variable tmp   : int_array;
        variable k, len, m, total : natural := 0;
    begin
        m := n;
        while m > 0 loop
            tmp(k) := m mod 10;
            k := k + 1;
            m := m / 10;
        end loop;
        for i in 0 to k - 1 loop
            seq(i) := tmp(k - 1 - i);
        end loop;
        len := k;
        while seq(len - 1) < n loop
            total := 0;
            for i in len - k to len - 1 loop
                total := total + seq(i);
            end loop;
            seq(len) := total;
            len := len + 1;
        end loop;
        return seq(len - 1) = n;
    end function;
begin
    process
    begin
        for n in 10 to 1199 loop
            if is_keith(n) then
                report integer'image(n);
            end if;
        end loop;
        wait;
    end process;
end architecture;
