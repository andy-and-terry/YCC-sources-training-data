-- Leyland numbers: x^y + y^x for x >= y >= 2 (simulation-only testbench).
entity leyland_numbers is
end entity;

architecture sim of leyland_numbers is
    function ipow(b, e : natural) return natural is
        variable r : natural := 1;
    begin
        for i in 1 to e loop
            r := r * b;
        end loop;
        return r;
    end function;
begin
    process
    begin
        for x in 2 to 4 loop
            for y in 2 to x loop
                report "leyland(" & integer'image(x) & "," & integer'image(y) & ") = " &
                       integer'image(ipow(x, y) + ipow(y, x));
            end loop;
        end loop;
        wait;
    end process;
end architecture;
