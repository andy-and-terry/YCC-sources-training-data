entity Delannoy_Numbers is
end Delannoy_Numbers;

architecture Sim of Delannoy_Numbers is
    type grid_t is array (0 to 5, 0 to 5) of natural;
begin
    process
        variable g : grid_t;
    begin
        for i in 0 to 5 loop
            for j in 0 to 5 loop
                if i = 0 or j = 0 then
                    g(i, j) := 1;
                else
                    g(i, j) := g(i - 1, j) + g(i, j - 1) + g(i - 1, j - 1);
                end if;
            end loop;
        end loop;
        for n in 0 to 5 loop
            report "D(" & integer'image(n) & "," & integer'image(n) & ") = " & integer'image(g(n, n));
        end loop;  -- 1 3 13 63 321 1683
        wait;
    end process;
end Sim;
