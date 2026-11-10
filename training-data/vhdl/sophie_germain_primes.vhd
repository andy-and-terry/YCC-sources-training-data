entity Sophie_Germain_Primes is
end Sophie_Germain_Primes;

architecture Sim of Sophie_Germain_Primes is
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
begin
    process
        variable found : natural := 0;
        variable p     : natural := 2;
    begin
        while found < 10 loop
            if is_prime(p) and is_prime(2 * p + 1) then
                report "sophie germain prime " & integer'image(p);
                found := found + 1;
            end if;
            p := p + 1;
        end loop;  -- 2 3 5 11 23 29 41 53 83 89
        wait;
    end process;
end Sim;
