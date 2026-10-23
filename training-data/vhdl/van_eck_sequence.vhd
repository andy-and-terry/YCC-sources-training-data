use std.textio.all;

entity Van_Eck_Sequence is
end Van_Eck_Sequence;

architecture Sim of Van_Eck_Sequence is
    type terms_t is array (0 to 19) of integer;
begin
    process
        variable t : terms_t := (others => 0);
        variable nxt : integer;
        variable l : line;
    begin
        write(l, integer'image(t(0)));
        for i in 0 to 18 loop
            nxt := 0;
            for j in i - 1 downto 0 loop
                if t(j) = t(i) then
                    nxt := i - j;
                    exit;
                end if;
            end loop;
            t(i + 1) := nxt;
            write(l, " " & integer'image(nxt));
        end loop;
        writeline(output, l);
        wait;
    end process;
end Sim;
