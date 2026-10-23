use std.textio.all;

entity Kolakoski_Sequence is
end Kolakoski_Sequence;

architecture Sim of Kolakoski_Sequence is
    type terms_t is array (0 to 31) of integer;
begin
    process
        variable s : terms_t := (others => 0);
        variable len, i, value : integer;
        variable l : line;
    begin
        s(0) := 1;
        s(1) := 2;
        s(2) := 2;
        len := 3;
        i := 2;
        while len < 20 loop
            value := 3 - s(len - 1);
            for j in 1 to s(i) loop
                s(len) := value;
                len := len + 1;
            end loop;
            i := i + 1;
        end loop;
        write(l, integer'image(s(0)));
        for k in 1 to 19 loop
            write(l, " " & integer'image(s(k)));
        end loop;
        writeline(output, l);
        wait;
    end process;
end Sim;
