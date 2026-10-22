use std.textio.all;

entity Aliquot_Sequence is
end Aliquot_Sequence;

architecture Sim of Aliquot_Sequence is
begin
    process
        variable n : integer := 12;
        variable total : integer;
        variable l : line;
    begin
        write(l, integer'image(n));
        while n /= 0 loop
            total := 0;
            for d in 1 to n / 2 loop
                if n mod d = 0 then
                    total := total + d;
                end if;
            end loop;
            n := total;
            write(l, " " & integer'image(n));
        end loop;
        writeline(output, l);
        wait;
    end process;
end Sim;
