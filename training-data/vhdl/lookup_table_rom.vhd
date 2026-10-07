library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Lookup_Table_ROM is
    Port ( clk  : in  STD_LOGIC;
           addr : in  STD_LOGIC_VECTOR(3 downto 0);
           data : out STD_LOGIC_VECTOR(7 downto 0));
end Lookup_Table_ROM;

architecture Behavioral of Lookup_Table_ROM is
    type rom_t is array (0 to 15) of integer range 0 to 255;
    constant ROM : rom_t := (0, 1, 4, 9, 16, 25, 36, 49,
                             64, 81, 100, 121, 144, 169, 196, 225);
begin
    process(clk)
    begin
        if rising_edge(clk) then
            data <= std_logic_vector(to_unsigned(ROM(to_integer(unsigned(addr))), 8));
        end if;
    end process;
end Behavioral;
