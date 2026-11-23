-- 6n(n-1)+1
entity StarNumbers_tb is
end StarNumbers_tb;

architecture sim of StarNumbers_tb is
    function term(n : integer) return integer is
    begin
        return ((6 * n) * (n - 1)) + 1;
    end function;
begin
    process
    begin
        for n in 1 to 15 loop
            report integer'image(n) & " -> " & integer'image(term(n));
        end loop;
        wait;
    end process;
end sim;
