use std.textio.all;

entity Ulam_Numbers is
end Ulam_Numbers;

architecture Sim of Ulam_Numbers is
    type terms_t is array (0 to 14) of integer;
begin
    process
        variable u : terms_t := (others => 0);
        variable len, candidate, ways : integer;
        variable l : line;
    begin
        u(0) := 1;
        u(1) := 2;
        len := 2;
        candidate := 3;
        while len < 15 loop
            ways := 0;
            for i in 0 to len - 2 loop
                for j in i + 1 to len - 1 loop
                    if u(i) + u(j) = candidate then
                        ways := ways + 1;
                    end if;
                end loop;
            end loop;
            if ways = 1 then
                u(len) := candidate;
                len := len + 1;
            end if;
            candidate := candidate + 1;
        end loop;
        write(l, integer'image(u(0)));
        for k in 1 to 14 loop
            write(l, " " & integer'image(u(k)));
        end loop;
        writeline(output, l);
        wait;
    end process;
end Sim;
