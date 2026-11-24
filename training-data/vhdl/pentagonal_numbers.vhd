-- Pentagonal numbers: n(3n-1)/2.
entity pentagonal_numbers is
end entity;

architecture sim of pentagonal_numbers is
begin
    process
    begin
        for n in 1 to 10 loop
            report integer'image(n * (3 * n - 1) / 2);
        end loop;
        wait;
    end process;
end architecture;
