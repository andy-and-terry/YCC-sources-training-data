entity Physical_Type_Demo is
end Physical_Type_Demo;

architecture Sim of Physical_Type_Demo is
    -- User-defined physical type with a primary and secondary units.
    type length is range 0 to 1000000
        units
            mm;
            cm = 10 mm;
            m  = 1000 mm;
        end units;
begin
    process
        constant a : length := 5 m;
        constant b : length := 25 cm;
        variable c : length;
    begin
        c := a + b;
        report "sum in mm = " & integer'image(c / mm);
        report "sum in cm = " & integer'image(c / cm);
        report "a / b = " & integer'image(a / b);
        report "length'left = " & length'image(length'left);

        -- Predefined physical type: time.
        report "1 us in ns = " & integer'image(1 us / 1 ns);
        report "time literal: " & time'image(2500 ps);
        wait;
    end process;
end Sim;
