entity Next_Exit_Loop_Demo is
end Next_Exit_Loop_Demo;

architecture Sim of Next_Exit_Loop_Demo is
begin
    process
        variable total : integer := 0;
    begin
        -- Labeled outer loop with next/exit conditions.
        outer : for i in 1 to 5 loop
            inner : for j in 1 to 5 loop
                next inner when j = 2;
                exit inner when j > 3;
                exit outer when i * j > 8;
                total := total + i * j;
                report "i=" & integer'image(i) & " j=" & integer'image(j);
            end loop inner;
            next outer when i mod 2 = 0;
            report "finished odd row " & integer'image(i);
        end loop outer;

        report "total = " & integer'image(total);

        -- while loop with exit.
        while true loop
            total := total - 7;
            exit when total < 0;
        end loop;
        report "after while: " & integer'image(total);
        wait;
    end process;
end Sim;
