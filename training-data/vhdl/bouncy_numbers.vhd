-- Bouncy numbers: digits are neither non-decreasing nor non-increasing.
-- Count them below 1000 (expected 525).
entity bouncy_numbers is
end entity;

architecture sim of bouncy_numbers is
    function is_bouncy(n : natural) return boolean is
        variable m    : natural := n / 10;
        variable prev : natural := n mod 10;
        variable d    : natural;
        variable inc  : boolean := true;
        variable dec  : boolean := true;
    begin
        while m > 0 loop
            d := m mod 10;
            if d > prev then inc := false; end if;
            if d < prev then dec := false; end if;
            prev := d;
            m := m / 10;
        end loop;
        return (not inc) and (not dec);
    end function;
begin
    process
        variable count : natural := 0;
    begin
        for n in 1 to 999 loop
            if is_bouncy(n) then
                count := count + 1;
            end if;
        end loop;
        report integer'image(count);
        wait;
    end process;
end architecture;
