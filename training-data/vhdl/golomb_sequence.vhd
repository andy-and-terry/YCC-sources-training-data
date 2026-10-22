use std.textio.all;

entity Golomb_Sequence is
end Golomb_Sequence;

architecture Sim of Golomb_Sequence is
    type seq_t is array (1 to 20) of integer;
begin
    process
        variable g : seq_t := (others => 0);
        variable l : line;
    begin
        g(1) := 1;
        for n in 2 to 20 loop
            g(n) := 1 + g(n - g(g(n - 1)));
        end loop;
        for n in 1 to 20 loop
            write(l, integer'image(g(n)) & " ");
        end loop;
        writeline(output, l);
        wait;
    end process;
end Sim;
