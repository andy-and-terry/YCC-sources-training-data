library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clock_generator_testbench is
end clock_generator_testbench;

architecture Sim of clock_generator_testbench is
    constant PERIOD : time := 10 ns;
    signal clk      : STD_LOGIC := '0';
    signal count    : integer := 0;
    signal finished : boolean := false;
begin
    -- Free-running clock that stops when the test ends
    clk <= not clk after PERIOD / 2 when not finished else clk;

    counter : process(clk)
    begin
        if rising_edge(clk) then
            count <= count + 1;
        end if;
    end process;

    stimulus : process
    begin
        wait for 10 * PERIOD;
        assert count >= 9 and count <= 10
            report "unexpected clock count" severity error;
        report "clock count = " & integer'image(count);
        finished <= true;
        wait;
    end process;
end Sim;
