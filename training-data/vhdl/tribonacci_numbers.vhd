-- Tribonacci: T0=0, T1=0, T2=1, T(n) = T(n-1) + T(n-2) + T(n-3)
entity tribonacci_numbers is
end entity;

architecture sim of tribonacci_numbers is
begin
    process
        variable a : natural := 0;
        variable b : natural := 0;
        variable c : natural := 1;
        variable nxt : natural;
    begin
        for i in 0 to 14 loop
            report "T(" & integer'image(i) & ") = " & integer'image(a);
            nxt := a + b + c;
            a := b;
            b := c;
            c := nxt;
        end loop;
        wait;
    end process;
end architecture;
