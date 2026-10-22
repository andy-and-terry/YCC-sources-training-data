use std.textio.all;

entity Recaman_Sequence is
end Recaman_Sequence;

architecture Sim of Recaman_Sequence is
    type flags_t is array (0 to 255) of boolean;
begin
    process
        variable seen : flags_t := (others => false);
        variable prev, nxt : integer := 0;
        variable l : line;
    begin
        seen(0) := true;
        write(l, integer'image(prev));
        for i in 1 to 19 loop
            nxt := prev - i;
            if nxt <= 0 then
                nxt := prev + i;
            elsif seen(nxt) then
                nxt := prev + i;
            end if;
            seen(nxt) := true;
            prev := nxt;
            write(l, " " & integer'image(nxt));
        end loop;
        writeline(output, l);
        wait;
    end process;
end Sim;
