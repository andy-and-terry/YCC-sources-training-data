use std.textio.all;

entity Delannoy_Numbers is
end Delannoy_Numbers;

architecture Sim of Delannoy_Numbers is
    type table_t is array (0 to 9, 0 to 9) of integer;
begin
    process
        variable d : table_t := (others => (others => 1));
        variable l : line;
    begin
        for m in 1 to 9 loop
            for n in 1 to 9 loop
                d(m, n) := d(m - 1, n) + d(m, n - 1) + d(m - 1, n - 1);
            end loop;
        end loop;
        write(l, integer'image(d(0, 0)));
        for k in 1 to 9 loop
            write(l, " " & integer'image(d(k, k)));
        end loop;
        writeline(output, l);
        wait;
    end process;
end Sim;
