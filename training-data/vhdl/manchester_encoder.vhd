library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Manchester_Encoder is
    Port ( clk, rst_n, data_in, data_valid : in  STD_LOGIC;
           manchester_out, ready           : out STD_LOGIC);
end Manchester_Encoder;

architecture Behavioral of Manchester_Encoder is
    signal phase  : STD_LOGIC := '0';
    signal data_q : STD_LOGIC := '0';
begin
    -- 0 -> high-to-low, 1 -> low-to-high; two clocks per data bit
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            phase <= '0';
            data_q <= '0';
            manchester_out <= '0';
            ready <= '1';
        elsif rising_edge(clk) then
            if phase = '0' then
                if data_valid = '1' then
                    data_q <= data_in;
                    manchester_out <= not data_in;
                    phase <= '1';
                    ready <= '0';
                end if;
            else
                manchester_out <= data_q;
                phase <= '0';
                ready <= '1';
            end if;
        end if;
    end process;
end Behavioral;
