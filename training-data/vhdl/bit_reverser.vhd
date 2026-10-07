library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bit_reverser is
    Generic ( WIDTH : integer := 8 );
    Port ( input  : in  STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           output : out STD_LOGIC_VECTOR(WIDTH-1 downto 0));
end bit_reverser;

architecture Behavioral of bit_reverser is
begin
    gen_rev : for i in 0 to WIDTH-1 generate
        output(i) <= input(WIDTH-1-i);
    end generate;
end Behavioral;
