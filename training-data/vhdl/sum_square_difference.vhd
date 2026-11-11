-- Square of the sum minus sum of squares for 1..10 (expect 2640)
entity SumSquareDifference_tb is
end entity;

architecture sim of SumSquareDifference_tb is
begin
    process
        variable total, squares : integer := 0;
    begin
        for i in 1 to 10 loop
            total := total + i;
            squares := squares + i * i;
        end loop;
        report integer'image(total * total - squares);
        wait;
    end process;
end architecture;
