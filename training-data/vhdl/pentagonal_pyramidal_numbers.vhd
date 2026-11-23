-- n^2(n+1)/2
entity PentagonalPyramidalNumbers_tb is
end PentagonalPyramidalNumbers_tb;

architecture sim of PentagonalPyramidalNumbers_tb is
    function term(n : integer) return integer is
    begin
        return ((n * n) * (n + 1)) / 2;
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
