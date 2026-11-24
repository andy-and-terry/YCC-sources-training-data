-- Repunits: R_n = 11...1 (n ones), built as R_{n-1}*10 + 1 (32-bit range: up to R_9).
entity repunit_numbers is
end entity;

architecture sim of repunit_numbers is
begin
    process
        variable r : natural := 0;
    begin
        for n in 1 to 9 loop
            r := r * 10 + 1;
            if r mod 3 = 0 then
                report integer'image(r) & "  (divisible by 3)";
            else
                report integer'image(r);
            end if;
        end loop;
        wait;
    end process;
end architecture;
