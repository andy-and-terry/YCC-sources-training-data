library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Synchronizer_2FF is
    Port ( clk, rst_n, async_in : in  STD_LOGIC;
           sync_out               : out STD_LOGIC);
end Synchronizer_2FF;

architecture Behavioral of Synchronizer_2FF is
    signal meta_stage, sync_stage : STD_LOGIC := '0';
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            meta_stage <= '0';
            sync_stage <= '0';
        elsif rising_edge(clk) then
            meta_stage <= async_in;
            sync_stage <= meta_stage;
        end if;
    end process;
    sync_out <= sync_stage;
end Behavioral;
