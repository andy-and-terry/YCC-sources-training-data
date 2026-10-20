library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_counter is end tb_counter;

architecture sim of tb_counter is
    signal clk : std_logic := '0';
    signal rst : std_logic := '1';
    signal cnt : unsigned(3 downto 0) := (others => '0');
    constant PERIOD : time := 10 ns;
    signal done : boolean := false;
begin
    clk <= not clk after PERIOD / 2 when not done else clk;

    dut : process (clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then cnt <= (others => '0'); else cnt <= cnt + 1; end if;
        end if;
    end process;

    stim : process
    begin
        wait for 25 ns;
        rst <= '0';
        wait for 10 * PERIOD;
        assert cnt > 0 report "counter did not advance" severity error;
        report "final count = " & integer'image(to_integer(cnt));
        done <= true;
        wait;
    end process;
end sim;
