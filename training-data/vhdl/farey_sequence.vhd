use std.textio.all;

entity Farey_Sequence is
end Farey_Sequence;

architecture Sim of Farey_Sequence is
begin
    process
        constant n : integer := 5;
        variable a, b, c, d, k, e, f : integer;
        variable l : line;
    begin
        a := 0; b := 1; c := 1; d := n;
        loop
            write(l, integer'image(a) & "/" & integer'image(b) & " ");
            exit when a = 1 and b = 1;
            k := (n + b) / d;
            e := k * c - a;
            f := k * d - b;
            a := c; b := d; c := e; d := f;
        end loop;
        writeline(output, l);
        wait;
    end process;
end Sim;
