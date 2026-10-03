library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BCD_To_Decimal_Decoder is
    Port ( bcd     : in  STD_LOGIC_VECTOR(3 downto 0);
           decimal : out STD_LOGIC_VECTOR(9 downto 0));
end BCD_To_Decimal_Decoder;

architecture Behavioral of BCD_To_Decimal_Decoder is
begin
    process(bcd)
    begin
        decimal <= (others => '0');
        case bcd is
            when "0000" => decimal(0) <= '1';
            when "0001" => decimal(1) <= '1';
            when "0010" => decimal(2) <= '1';
            when "0011" => decimal(3) <= '1';
            when "0100" => decimal(4) <= '1';
            when "0101" => decimal(5) <= '1';
            when "0110" => decimal(6) <= '1';
            when "0111" => decimal(7) <= '1';
            when "1000" => decimal(8) <= '1';
            when "1001" => decimal(9) <= '1';
            when others => decimal <= (others => '0');
        end case;
    end process;
end Behavioral;
