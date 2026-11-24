-- Hexagonal numbers: n(2n-1).
entity hexagonal_numbers is
end entity;

architecture sim of hexagonal_numbers is
begin
    process
    begin
        for n in 1 to 10 loop
            report integer'image(n * (2 * n - 1));
        end loop;
        wait;
    end process;
end architecture;
