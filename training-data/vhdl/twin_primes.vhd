entity Twin_Primes is
end Twin_Primes;

architecture Sim of Twin_Primes is
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
    begin
        for p in 3 to 78 loop
            if is_prime(p) and is_prime(p + 2) then
                report "twin pair (" & integer'image(p) & "," & integer'image(p + 2) & ")";
            end if;
        end loop;  -- (3,5) (5,7) (11,13) (17,19) (29,31) (41,43) (59,61) (71,73)
        wait;
    end process;
end Sim;
