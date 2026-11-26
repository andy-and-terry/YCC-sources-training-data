-- Squarefree numbers up to 100; expect 61. (simulation-only)
entity squarefree_numbers is
end entity;

architecture sim of squarefree_numbers is
    function squarefree(n : integer) return boolean is
        variable d : integer := 2;
    begin
        while d * d <= n loop
            if n mod (d * d) = 0 then return false; end if;
            d := d + 1;
        end loop;
        return true;
    end function;
begin
    process
        variable c : integer := 0;
    begin
        for n in 1 to 100 loop
            if squarefree(n) then c := c + 1; end if;
        end loop;
        report integer'image(c);
        wait;
    end process;
end architecture;
