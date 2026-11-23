-- n(n+1)(n+2)(n+3)/24
entity PentatopeNumbers_tb is
end PentatopeNumbers_tb;

architecture sim of PentatopeNumbers_tb is
    function term(n : integer) return integer is
    begin
        return (((n * (n + 1)) * (n + 2)) * (n + 3)) / 24;
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
