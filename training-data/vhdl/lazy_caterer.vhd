-- Lazy caterer sequence: max pieces from n cuts
entity LazyCaterer_tb is
end entity;

architecture sim of LazyCaterer_tb is
    function term(n : integer) return integer is
    begin
        return ((n * (n + 1))/2) + 1;
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
