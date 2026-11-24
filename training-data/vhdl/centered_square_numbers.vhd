-- Centered square numbers: n^2 + (n+1)^2.
entity centered_square_numbers is
end entity;

architecture sim of centered_square_numbers is
begin
    process
    begin
        for n in 0 to 9 loop
            report integer'image(n * n + (n + 1) * (n + 1));
        end loop;
        wait;
    end process;
end architecture;
