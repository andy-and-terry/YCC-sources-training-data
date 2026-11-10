entity Cake_Numbers is
end Cake_Numbers;

architecture Sim of Cake_Numbers is
    function cake (n : natural) return natural is
    begin
        return (n * n * n + 5 * n + 6) / 6;
    end function;
begin
    process
    begin
        for n in 0 to 9 loop
            report "cake(" & integer'image(n) & ") = " & integer'image(cake(n));
        end loop;  -- 1 2 4 8 15 26 42 64 93 130
        wait;
    end process;
end Sim;
