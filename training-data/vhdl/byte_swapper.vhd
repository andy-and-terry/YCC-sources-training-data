library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Converts a 32-bit word between big-endian and little-endian byte order.
entity Byte_Swapper is
    Port ( data_in  : in  STD_LOGIC_VECTOR(31 downto 0);
           swap_en  : in  STD_LOGIC;
           data_out : out STD_LOGIC_VECTOR(31 downto 0));
end Byte_Swapper;

architecture Behavioral of Byte_Swapper is
    signal swapped : STD_LOGIC_VECTOR(31 downto 0);
begin
    swapped <= data_in(7 downto 0) & data_in(15 downto 8) &
               data_in(23 downto 16) & data_in(31 downto 24);
    data_out <= swapped when swap_en = '1' else data_in;
end Behavioral;
