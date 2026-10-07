library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity manchester_encoder is
    Port ( clk, rst_n : in  STD_LOGIC;
           data_in    : in  STD_LOGIC;
           manchester_out : out STD_LOGIC);
end manchester_encoder;

architecture Behavioral of manchester_encoder is
    signal phase : STD_LOGIC := '0';
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            phase <= '0';
            manchester_out <= '0';
        elsif rising_edge(clk) then
            phase <= not phase;
            -- data XOR clock phase gives the Manchester waveform
            manchester_out <= data_in xor phase;
        end if;
    end process;
end Behavioral;
