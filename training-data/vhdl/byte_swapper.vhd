library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity byte_swapper is
    port ( data_in  : in  std_logic_vector(31 downto 0);
           swap_en  : in  std_logic;
           data_out : out std_logic_vector(31 downto 0) );
end byte_swapper;

architecture Behavioral of byte_swapper is
    signal swapped : std_logic_vector(31 downto 0);
begin
    swapped <= data_in(7 downto 0) & data_in(15 downto 8) &
               data_in(23 downto 16) & data_in(31 downto 24);
    data_out <= swapped when swap_en = '1' else data_in;
end Behavioral;
