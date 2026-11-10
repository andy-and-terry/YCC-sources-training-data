entity Superperfect_Numbers is
end Superperfect_Numbers;

architecture Sim of Superperfect_Numbers is
    function sigma (n : positive) return positive is
        variable s : natural := 0;
    begin
        for d in 1 to n loop
            if n mod d = 0 then s := s + d; end if;
        end loop;
        return s;
    end function;
begin
    process
    begin
        for n in 1 to 99 loop
            if sigma(sigma(n)) = 2 * n then
                report "superperfect " & integer'image(n);
            end if;
        end loop;  -- 2 4 16 64
        wait;
    end process;
end Sim;
