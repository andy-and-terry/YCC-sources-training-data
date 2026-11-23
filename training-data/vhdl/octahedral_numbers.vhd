-- n(2n^2+1)/3
entity OctahedralNumbers_tb is
end OctahedralNumbers_tb;

architecture sim of OctahedralNumbers_tb is
    function term(n : integer) return integer is
    begin
        return (n * (((2 * n) * n) + 1)) / 3;
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
