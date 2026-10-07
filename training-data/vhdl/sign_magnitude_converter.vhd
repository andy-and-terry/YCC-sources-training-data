library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Sign_Magnitude_Converter is
    Port ( twos_complement : in  STD_LOGIC_VECTOR(7 downto 0);
           sign_magnitude  : out STD_LOGIC_VECTOR(7 downto 0));
end Sign_Magnitude_Converter;

architecture Behavioral of Sign_Magnitude_Converter is
begin
    process(twos_complement)
        variable magnitude : unsigned(6 downto 0);
    begin
        if twos_complement(7) = '1' then
            magnitude := unsigned(not twos_complement(6 downto 0)) + 1;
            sign_magnitude <= '1' & std_logic_vector(magnitude);
        else
            sign_magnitude <= '0' & twos_complement(6 downto 0);
        end if;
    end process;
end Behavioral;
