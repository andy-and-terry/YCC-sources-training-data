library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Bit_Reverser is
    generic ( WIDTH : positive := 8 );
    Port ( data_in  : in  STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           data_out : out STD_LOGIC_VECTOR(WIDTH-1 downto 0));
end Bit_Reverser;

architecture Behavioral of Bit_Reverser is
begin
    process(data_in)
    begin
        for i in 0 to WIDTH-1 loop
            data_out(i) <= data_in(WIDTH-1-i);
        end loop;
    end process;
end Behavioral;
