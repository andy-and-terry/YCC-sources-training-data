-- n(n+1)(n+2)/6
entity TetrahedralNumbers_tb is
end TetrahedralNumbers_tb;

architecture sim of TetrahedralNumbers_tb is
    function term(n : integer) return integer is
    begin
        return ((n * (n + 1)) * (n + 2)) / 6;
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
