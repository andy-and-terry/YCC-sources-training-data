library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Watchdog_Timer is
    Generic ( TIMEOUT : integer := 1000 );
    Port ( clk, rst_n, kick : in  STD_LOGIC;
           timeout_flag       : out STD_LOGIC);
end Watchdog_Timer;

architecture Behavioral of Watchdog_Timer is
    signal counter : integer range 0 to TIMEOUT := 0;
    signal timeout_internal : STD_LOGIC := '0';
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            counter <= 0;
            timeout_internal <= '0';
        elsif rising_edge(clk) then
            if kick = '1' then
                counter <= 0;
                timeout_internal <= '0';
            elsif counter >= TIMEOUT then
                timeout_internal <= '1';
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;
    timeout_flag <= timeout_internal;
end Behavioral;
