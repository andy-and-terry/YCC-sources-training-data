use STD.TEXTIO.ALL;

-- Testbench: print the Goldbach pair for 28.
entity Goldbach_Pair_TB is
end Goldbach_Pair_TB;

architecture Sim of Goldbach_Pair_TB is
    function is_prime(n : integer) return boolean is
    begin
        if n < 2 then return false; end if;
        for d in 2 to n - 1 loop
            if d * d > n then exit; end if;
            if n mod d = 0 then return false; end if;
        end loop;
        return true;
    end function;
begin
    process
        variable l : line;
    begin
        for p in 2 to 14 loop
            if is_prime(p) and is_prime(28 - p) then
                write(l, integer'image(p) & " + " & integer'image(28 - p));
                writeline(output, l);
                exit;
            end if;
        end loop;
        wait;
    end process;
end Sim;
