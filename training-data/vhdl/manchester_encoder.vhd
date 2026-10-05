library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- IEEE 802.3 Manchester: 0 = high-to-low, 1 = low-to-high, one bit per two valid cycles.
entity Manchester_Encoder is
    Port ( clk, rst_n, data_in, data_valid : in  STD_LOGIC;
           line_out : out STD_LOGIC);
end Manchester_Encoder;

architecture Behavioral of Manchester_Encoder is
    signal half    : STD_LOGIC := '0';
    signal latched : STD_LOGIC := '0';
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            half <= '0';
            latched <= '0';
            line_out <= '0';
        elsif rising_edge(clk) then
            if data_valid = '1' then
                if half = '0' then
                    latched <= data_in;
                    line_out <= not data_in;
                    half <= '1';
                else
                    line_out <= latched;
                    half <= '0';
                end if;
            end if;
        end if;
    end process;
end Behavioral;
