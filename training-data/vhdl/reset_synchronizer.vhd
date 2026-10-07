library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reset_Synchronizer is
    Port ( clk         : in  STD_LOGIC;
           async_rst_n : in  STD_LOGIC;
           sync_rst_n  : out STD_LOGIC);
end Reset_Synchronizer;

architecture Behavioral of Reset_Synchronizer is
    signal sync_stage : STD_LOGIC_VECTOR(1 downto 0) := "00";
begin
    process(clk, async_rst_n)
    begin
        if async_rst_n = '0' then
            sync_stage <= "00";
        elsif rising_edge(clk) then
            sync_stage <= sync_stage(0) & '1';
        end if;
    end process;

    sync_rst_n <= sync_stage(1);
end Behavioral;
