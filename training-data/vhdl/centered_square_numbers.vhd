-- Centered square numbers 2n(n+1)+1
entity CenteredSquareNumbers_tb is
end entity;

architecture sim of CenteredSquareNumbers_tb is
    function term(n : integer) return integer is
    begin
        return ((2 * n) * (n + 1)) + 1;
    end function;
begin
    process
    begin
        for n in 0 to 9 loop
            report integer'image(term(n));
        end loop;
        wait;
    end process;
end architecture;
