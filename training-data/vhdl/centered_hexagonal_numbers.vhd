-- 3n(n-1)+1
entity CenteredHexagonalNumbers_tb is
end CenteredHexagonalNumbers_tb;

architecture sim of CenteredHexagonalNumbers_tb is
    function term(n : integer) return integer is
    begin
        return ((3 * n) * (n - 1)) + 1;
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
