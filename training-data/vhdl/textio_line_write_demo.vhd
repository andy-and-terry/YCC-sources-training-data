library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use STD.TEXTIO.ALL;

-- Formatted console output using TEXTIO lines.
entity textio_line_write_demo is
end textio_line_write_demo;

architecture Behavioral of textio_line_write_demo is
begin
    process
        variable l : line;
        variable v : unsigned(7 downto 0);
        variable r : real := 3.14159;
    begin
        write(l, string'("value table"));
        writeline(output, l);

        for i in 0 to 4 loop
            v := to_unsigned(i * 37, 8);
            write(l, i, right, 3);
            write(l, string'(" | "));
            write(l, std_logic_vector(v));
            write(l, string'(" | "));
            write(l, to_integer(v), right, 4);
            writeline(output, l);
        end loop;

        write(l, string'("pi ~ "));
        write(l, r, right, 8, 3);
        write(l, string'(" at "));
        write(l, now, right, 0, ns);
        writeline(output, l);
        wait;
    end process;
end Behavioral;
