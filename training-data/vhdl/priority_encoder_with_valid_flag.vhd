library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Priority_Encoder_With_Valid_Flag is
    Port ( req   : in  STD_LOGIC_VECTOR(3 downto 0);
           code  : out STD_LOGIC_VECTOR(1 downto 0);
           valid : out STD_LOGIC);
end Priority_Encoder_With_Valid_Flag;

architecture Behavioral of Priority_Encoder_With_Valid_Flag is
begin
    valid <= '0' when req = "0000" else '1';
    code <= "11" when req(3) = '1' else
            "10" when req(2) = '1' else
            "01" when req(1) = '1' else
            "00";
end Behavioral;
