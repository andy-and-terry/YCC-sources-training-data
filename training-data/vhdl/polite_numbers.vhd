-- Ways to write n as a sum of two or more consecutive positive integers.
entity polite_numbers is
end entity;

architecture sim of polite_numbers is
    function polite_ways(n : natural) return natural is
        variable k    : natural := 2;
        variable ways : natural := 0;
    begin
        while k * (k + 1) / 2 <= n loop
            if (n - k * (k - 1) / 2) mod k = 0 then
                ways := ways + 1;
            end if;
            k := k + 1;
        end loop;
        return ways;
    end function;
begin
    process
    begin
        for n in 1 to 16 loop
            report "polite_ways(" & integer'image(n) & ") = " & integer'image(polite_ways(n));
        end loop;
        wait;
    end process;
end architecture;
