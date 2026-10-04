library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity bit_reverser is
    generic ( WIDTH : positive := 8 );
    port ( data_in  : in  std_logic_vector(WIDTH-1 downto 0);
           data_out : out std_logic_vector(WIDTH-1 downto 0) );
end bit_reverser;

architecture Behavioral of bit_reverser is
begin
    rev : for i in 0 to WIDTH-1 generate
        data_out(i) <= data_in(WIDTH-1-i);
    end generate;
end Behavioral;
