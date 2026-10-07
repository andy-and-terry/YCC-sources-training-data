library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity rom_lookup_table is
    Port ( addr : in  STD_LOGIC_VECTOR(2 downto 0);
           data : out STD_LOGIC_VECTOR(7 downto 0));
end rom_lookup_table;

architecture Behavioral of rom_lookup_table is
    type rom_t is array (0 to 7) of integer range 0 to 255;
    -- Sine table (unsigned, offset 128)
    constant ROM : rom_t := (128, 218, 255, 218, 128, 37, 0, 37);
begin
    data <= std_logic_vector(to_unsigned(ROM(to_integer(unsigned(addr))), 8));
end Behavioral;
