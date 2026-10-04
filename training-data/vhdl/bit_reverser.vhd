library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Bit_Reverser is
    Generic ( WIDTH : integer := 8 );
    Port ( data_in  : in  STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           data_out : out STD_LOGIC_VECTOR(WIDTH-1 downto 0));
end Bit_Reverser;

architecture Behavioral of Bit_Reverser is
begin
    rev : for i in 0 to WIDTH-1 generate
        data_out(i) <= data_in(WIDTH-1-i);
    end generate;
end Behavioral;
