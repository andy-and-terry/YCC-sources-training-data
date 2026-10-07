library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Pulse_Stretcher is
    Generic ( STRETCH_CYCLES : integer := 8 );
    Port ( clk, rst_n, pulse_in : in  STD_LOGIC;
           pulse_out             : out STD_LOGIC);
end Pulse_Stretcher;

architecture Behavioral of Pulse_Stretcher is
    signal counter : integer range 0 to STRETCH_CYCLES := 0;
begin
    pulse_out <= '1' when counter > 0 else '0';

    process(clk, rst_n)
    begin
        if rst_n = '0' then
            counter <= 0;
        elsif rising_edge(clk) then
            if pulse_in = '1' then
                counter <= STRETCH_CYCLES;
            elsif counter > 0 then
                counter <= counter - 1;
            end if;
        end if;
    end process;
end Behavioral;
