library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Twos_Complement_Converter is
    Generic ( WIDTH : integer := 8 );
    Port ( value           : in  STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           twos_complement : out STD_LOGIC_VECTOR(WIDTH-1 downto 0));
end Twos_Complement_Converter;

architecture Behavioral of Twos_Complement_Converter is
begin
    twos_complement <= std_logic_vector(unsigned(not value) + 1);
end Behavioral;
