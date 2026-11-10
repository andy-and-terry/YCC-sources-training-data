entity Emirps is
end Emirps;

architecture Sim of Emirps is
    function is_prime (n : natural) return boolean is
        variable i : natural := 2;
    begin
        if n < 2 then return false; end if;
        while i * i <= n loop
            if n mod i = 0 then return false; end if;
            i := i + 1;
        end loop;
        return true;
    end function;

    function reverse_digits (n : natural) return natural is
        variable x : natural := n;
        variable r : natural := 0;
    begin
        while x > 0 loop
            r := r * 10 + x mod 10;
            x := x / 10;
        end loop;
        return r;
    end function;
begin
    process
        variable count : natural := 0;
        variable n     : natural := 2;
        variable r     : natural;
    begin
        while count < 10 loop
            r := reverse_digits(n);
            if r /= n and is_prime(n) and is_prime(r) then
                report "emirp " & integer'image(n);
                count := count + 1;
            end if;
            n := n + 1;
        end loop;  -- 13 17 31 37 71 73 79 97 107 113
        wait;
    end process;
end Sim;
