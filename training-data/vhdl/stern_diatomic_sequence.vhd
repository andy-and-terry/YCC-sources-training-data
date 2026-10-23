use std.textio.all;

entity Stern_Diatomic_Sequence is
end Stern_Diatomic_Sequence;

architecture Sim of Stern_Diatomic_Sequence is
    type terms_t is array (0 to 19) of integer;
begin
    process
        variable s : terms_t := (others => 0);
        variable l : line;
    begin
        s(1) := 1;
        for n in 2 to 19 loop
            if n mod 2 = 0 then
                s(n) := s(n / 2);
            else
                s(n) := s(n / 2) + s(n / 2 + 1);
            end if;
        end loop;
        write(l, integer'image(s(0)));
        for n in 1 to 19 loop
            write(l, " " & integer'image(s(n)));
        end loop;
        writeline(output, l);
        wait;
    end process;
end Sim;
