library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity thermometer_encoder is
    Generic ( N : integer := 8 );
    Port ( value  : in  integer range 0 to N;
           thermo : out STD_LOGIC_VECTOR(N-1 downto 0));
end thermometer_encoder;

architecture Behavioral of thermometer_encoder is
begin
    -- thermo(i) is high when value > i
    gen_bits : for i in 0 to N-1 generate
        thermo(i) <= '1' when value > i else '0';
    end generate;
end Behavioral;
