library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CRC_Calculator is
    Port ( clk, rst_n, data_in, data_valid : in  STD_LOGIC;
           crc_out                          : out STD_LOGIC_VECTOR(7 downto 0));
end CRC_Calculator;

architecture Behavioral of CRC_Calculator is
    signal crc_reg : STD_LOGIC_VECTOR(7 downto 0) := "11111111";
    signal feedback : STD_LOGIC;
begin
    feedback <= crc_reg(7) xor data_in;
    crc_out <= crc_reg;

    process(clk, rst_n)
    begin
        if rst_n = '0' then
            crc_reg <= "11111111";
        elsif rising_edge(clk) then
            if data_valid = '1' then
                if feedback = '1' then
                    crc_reg <= (crc_reg(6 downto 0) & '0') xor "00000111";
                else
                    crc_reg <= crc_reg(6 downto 0) & '0';
                end if;
            end if;
        end if;
    end process;
end Behavioral;
