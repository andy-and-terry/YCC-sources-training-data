library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity One_Shot_Pulse_Generator is
    Port ( clk, rst_n, trigger : in  STD_LOGIC;
           pulse                 : out STD_LOGIC);
end One_Shot_Pulse_Generator;

architecture Behavioral of One_Shot_Pulse_Generator is
    signal prev_trigger : STD_LOGIC := '0';
    signal pulse_internal : STD_LOGIC := '0';
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            prev_trigger <= '0';
            pulse_internal <= '0';
        elsif rising_edge(clk) then
            prev_trigger <= trigger;
            pulse_internal <= trigger and not prev_trigger;
        end if;
    end process;
    pulse <= pulse_internal;
end Behavioral;
