library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity BCD_To_Binary_Converter is
    Port ( bcd_tens  : in  STD_LOGIC_VECTOR(3 downto 0);
           bcd_ones  : in  STD_LOGIC_VECTOR(3 downto 0);
           binary    : out STD_LOGIC_VECTOR(7 downto 0));
end BCD_To_Binary_Converter;

architecture Behavioral of BCD_To_Binary_Converter is
begin
    process(bcd_tens, bcd_ones)
        variable tens_val  : integer;
        variable ones_val  : integer;
    begin
        tens_val := to_integer(unsigned(bcd_tens));
        ones_val := to_integer(unsigned(bcd_ones));
        binary <= std_logic_vector(to_unsigned(tens_val * 10 + ones_val, 8));
    end process;
end Behavioral;
