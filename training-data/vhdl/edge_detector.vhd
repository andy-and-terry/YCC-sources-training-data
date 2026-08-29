library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Edge_Detector is
    Port ( clk, rst_n, signal_in           : in  STD_LOGIC;
           rising_edge_out, falling_edge_out : out STD_LOGIC);
end Edge_Detector;

architecture Behavioral of Edge_Detector is
    signal prev : STD_LOGIC := '0';
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            prev <= '0';
        elsif rising_edge(clk) then
            prev <= signal_in;
        end if;
    end process;
    rising_edge_out <= signal_in and not prev;
    falling_edge_out <= (not signal_in) and prev;
end Behavioral;
