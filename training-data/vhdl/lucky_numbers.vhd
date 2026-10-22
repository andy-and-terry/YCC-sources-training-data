use std.textio.all;

entity Lucky_Numbers is
end Lucky_Numbers;

architecture Sim of Lucky_Numbers is
    type nums_t is array (0 to 31) of integer;
begin
    process
        variable nums : nums_t := (others => 0);
        variable len, idx, step, kept : integer := 0;
        variable l : line;
    begin
        for n in 0 to 24 loop
            nums(n) := 2 * n + 1;
        end loop;
        len := 25;
        idx := 1;
        while idx < len and nums(idx) <= len loop
            step := nums(idx);
            kept := 0;
            for j in 0 to len - 1 loop
                if (j + 1) mod step /= 0 then
                    nums(kept) := nums(j);
                    kept := kept + 1;
                end if;
            end loop;
            len := kept;
            idx := idx + 1;
        end loop;
        write(l, integer'image(nums(0)));
        for j in 1 to len - 1 loop
            write(l, " " & integer'image(nums(j)));
        end loop;
        writeline(output, l);
        wait;
    end process;
end Sim;
