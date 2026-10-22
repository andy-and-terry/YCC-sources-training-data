use std.textio.all;

entity Hofstadter_Q_Sequence is
end Hofstadter_Q_Sequence;

architecture Sim of Hofstadter_Q_Sequence is
    type seq_t is array (1 to 20) of integer;
begin
    process
        variable q : seq_t := (others => 0);
        variable l : line;
    begin
        q(1) := 1;
        q(2) := 1;
        for n in 3 to 20 loop
            q(n) := q(n - q(n - 1)) + q(n - q(n - 2));
        end loop;
        for n in 1 to 20 loop
            write(l, integer'image(q(n)) & " ");
        end loop;
        writeline(output, l);
        wait;
    end process;
end Sim;
