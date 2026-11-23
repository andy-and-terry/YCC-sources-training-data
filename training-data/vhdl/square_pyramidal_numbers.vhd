-- n(n+1)(2n+1)/6
entity SquarePyramidalNumbers_tb is
end SquarePyramidalNumbers_tb;

architecture sim of SquarePyramidalNumbers_tb is
    function term(n : integer) return integer is
    begin
        return ((n * (n + 1)) * ((2 * n) + 1)) / 6;
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
