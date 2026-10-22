use std.textio.all;

entity Ulam_Numbers is
end Ulam_Numbers;

architecture Sim of Ulam_Numbers is
    type terms_t is array (0 to 14) of integer;
begin
    process
        variable terms : terms_t := (others => 0);
        variable len : integer := 2;
        variable c : integer := 3;
        variable ways : integer;
        variable l : line;
    begin
        terms(0) := 1;
        terms(1) := 2;
        while len < 15 loop
            ways := 0;
            for i in 0 to len - 2 loop
                for j in i + 1 to len - 1 loop
                    if terms(i) + terms(j) = c then
                        ways := ways + 1;
                    end if;
                end loop;
            end loop;
            if ways = 1 then
                terms(len) := c;
                len := len + 1;
            end if;
            c := c + 1;
        end loop;
        write(l, integer'image(terms(0)));
        for i in 1 to 14 loop
            write(l, " " & integer'image(terms(i)));
        end loop;
        writeline(output, l);
        wait;
    end process;
end Sim;
