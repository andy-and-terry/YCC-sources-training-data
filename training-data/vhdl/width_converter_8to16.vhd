library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Width_Converter_8to16 is
    Port ( clk, rst_n, in_valid : in  STD_LOGIC;
           in_data              : in  STD_LOGIC_VECTOR(7 downto 0);
           out_valid            : out STD_LOGIC;
           out_data             : out STD_LOGIC_VECTOR(15 downto 0));
end Width_Converter_8to16;

architecture Behavioral of Width_Converter_8to16 is
    signal have_low : STD_LOGIC := '0';
    signal low_byte : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            have_low  <= '0';
            low_byte  <= (others => '0');
            out_valid <= '0';
            out_data  <= (others => '0');
        elsif rising_edge(clk) then
            out_valid <= '0';
            if in_valid = '1' then
                if have_low = '0' then
                    low_byte <= in_data;
                    have_low <= '1';
                else
                    out_data  <= in_data & low_byte;
                    out_valid <= '1';
                    have_low  <= '0';
                end if;
            end if;
        end if;
    end process;
end Behavioral;
