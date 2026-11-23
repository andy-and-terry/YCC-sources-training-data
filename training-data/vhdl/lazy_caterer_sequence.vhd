-- n(n+1)/2+1
entity LazyCatererSequence_tb is
end LazyCatererSequence_tb;

architecture sim of LazyCatererSequence_tb is
    function term(n : integer) return integer is
    begin
        return ((n * (n + 1)) / 2) + 1;
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
