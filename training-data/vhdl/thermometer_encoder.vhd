library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity thermometer_encoder is
    port ( binary      : in  unsigned(2 downto 0);
           thermometer : out std_logic_vector(6 downto 0) );
end thermometer_encoder;

architecture Behavioral of thermometer_encoder is
begin
    bits : for i in 0 to 6 generate
        thermometer(i) <= '1' when binary > i else '0';
    end generate;
end Behavioral;
