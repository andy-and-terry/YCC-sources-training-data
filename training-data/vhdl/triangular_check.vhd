-- n is triangular iff 8n + 1 is a perfect square.
entity triangular_check is
end entity;

architecture sim of triangular_check is
    function is_triangular(n : natural) return boolean is
        variable s : natural := 8 * n + 1;
        variable r : natural := 0;
    begin
        while (r + 1) * (r + 1) <= s loop
            r := r + 1;
        end loop;
        return r * r = s;
    end function;
begin
    process
    begin
        for n in 0 to 20 loop
            if is_triangular(n) then
                report "triangular: " & integer'image(n);
            end if;
        end loop;
        wait;
    end process;
end architecture;
