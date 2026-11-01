-- Reverse-and-add until a palindrome; count the steps.
entity lychrel_steps is
end entity;

architecture sim of lychrel_steps is
    function reverse_digits(v : natural) return natural is
        variable m : natural := v;
        variable r : natural := 0;
    begin
        while m > 0 loop
            r := r * 10 + (m mod 10);
            m := m / 10;
        end loop;
        return r;
    end function;

    function steps(start : natural) return integer is
        variable n : natural := start;
    begin
        for count in 0 to 49 loop
            if count > 0 and n = reverse_digits(n) then
                return count;
            end if;
            n := n + reverse_digits(n);
        end loop;
        return -1;
    end function;
begin
    process
    begin
        report "steps(56) = " & integer'image(steps(56));
        report "steps(59) = " & integer'image(steps(59));
        report "steps(79) = " & integer'image(steps(79));
        wait;
    end process;
end architecture;
