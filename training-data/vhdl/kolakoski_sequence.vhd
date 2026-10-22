use std.textio.all;

entity Kolakoski_Sequence is
end Kolakoski_Sequence;

architecture Sim of Kolakoski_Sequence is
    type seq_t is array (0 to 25) of integer;
begin
    process
        variable a : seq_t := (others => 0);
        variable w : integer := 3;
        variable r : integer := 2;
        variable v : integer := 1;
        variable l : line;
    begin
        a(0) := 1;
        a(1) := 2;
        a(2) := 2;
        while w < 20 loop
            for k in 1 to a(r) loop
                a(w) := v;
                w := w + 1;
            end loop;
            v := 3 - v;
            r := r + 1;
        end loop;
        write(l, integer'image(a(0)));
        for i in 1 to 19 loop
            write(l, " " & integer'image(a(i)));
        end loop;
        writeline(output, l);
        wait;
    end process;
end Sim;
