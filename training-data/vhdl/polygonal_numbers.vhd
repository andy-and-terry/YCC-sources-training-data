use std.textio.all;

entity Polygonal_Numbers is
end Polygonal_Numbers;

architecture Sim of Polygonal_Numbers is
    function polygonal(s, n : integer) return integer is
    begin
        return ((s - 2) * n * n - (s - 4) * n) / 2;
    end function;

    type sides_t is array (0 to 2) of integer;
    constant sides : sides_t := (3, 5, 6);
begin
    process
        variable l : line;
    begin
        for i in sides'range loop
            write(l, "sides=" & integer'image(sides(i)) & ":");
            for n in 1 to 10 loop
                write(l, " " & integer'image(polygonal(sides(i), n)));
            end loop;
            writeline(output, l);
        end loop;
        wait;
    end process;
end Sim;
