library IEEE;
use IEEE.MATH_REAL.ALL;

-- Simulation-only floating-point secant method for x^2 - 2.
entity secant_math_testbench is
end secant_math_testbench;

architecture Sim of secant_math_testbench is
    function f(x : real) return real is
    begin
        return x * x - 2.0;
    end function;
begin
    process
        variable x0 : real := 1.0;
        variable x1 : real := 2.0;
        variable nx : real;
    begin
        for i in 1 to 50 loop
            exit when f(x1) = f(x0);
            nx := x1 - f(x1) * (x1 - x0) / (f(x1) - f(x0));
            x0 := x1;
            x1 := nx;
            exit when abs(x1 - x0) < 1.0e-12;
        end loop;
        report "root = " & real'image(x1);
        wait;
    end process;
end Sim;
