entity Refactorable_Numbers is
end Refactorable_Numbers;

architecture Sim of Refactorable_Numbers is
    function tau (n : positive) return positive is
        variable c : natural := 0;
    begin
        for d in 1 to n loop
            if n mod d = 0 then c := c + 1; end if;
        end loop;
        return c;
    end function;
begin
    process
    begin
        for n in 1 to 59 loop
            if n mod tau(n) = 0 then
                report "refactorable " & integer'image(n);
            end if;
        end loop;  -- 1 2 8 9 12 18 24 36 40 56
        wait;
    end process;
end Sim;
