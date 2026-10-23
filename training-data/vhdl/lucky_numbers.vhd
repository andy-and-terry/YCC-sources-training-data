use std.textio.all;

entity Lucky_Numbers is
end Lucky_Numbers;

architecture Sim of Lucky_Numbers is
    type list_t is array (0 to 63) of integer;
begin
    process
        variable lk : list_t := (others => 0);
        variable len, idx, step, kept : integer;
        variable l : line;
    begin
        for i in 0 to 49 loop
            lk(i) := 2 * i + 1;
        end loop;
        len := 50;
        idx := 1;
        while idx < len and lk(idx) <= len loop
            step := lk(idx);
            kept := 0;
            for k in 0 to len - 1 loop
                if (k + 1) mod step /= 0 then
                    lk(kept) := lk(k);
                    kept := kept + 1;
                end if;
            end loop;
            len := kept;
            idx := idx + 1;
        end loop;
        write(l, integer'image(lk(0)));
        for k in 1 to len - 1 loop
            write(l, " " & integer'image(lk(k)));
        end loop;
        writeline(output, l);
        wait;
    end process;
end Sim;
