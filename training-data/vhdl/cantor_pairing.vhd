-- Cantor pairing function and its inverse (simulation-only).
entity cantor_pairing is
end entity;

architecture sim of cantor_pairing is
    function pair(x, y : natural) return natural is
    begin
        return (x + y) * (x + y + 1) / 2 + y;
    end function;

    -- integer square root by search, avoiding floating point
    function isqrt(n : natural) return natural is
        variable r : natural := 0;
    begin
        while (r + 1) * (r + 1) <= n loop
            r := r + 1;
        end loop;
        return r;
    end function;
begin
    process
        variable w, x, y : natural;
    begin
        report integer'image(pair(3, 4));            -- 32
        w := (isqrt(8 * 32 + 1) - 1) / 2;
        y := 32 - w * (w + 1) / 2;
        x := w - y;
        report integer'image(x) & " " & integer'image(y);  -- 3 4
        wait;
    end process;
end architecture;
