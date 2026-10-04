library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ROM_Lookup_Table is
    Port ( clk  : in  STD_LOGIC;
           addr : in  STD_LOGIC_VECTOR(3 downto 0);
           data : out STD_LOGIC_VECTOR(7 downto 0));
end ROM_Lookup_Table;

architecture Behavioral of ROM_Lookup_Table is
    type rom_t is array (0 to 15) of integer range 0 to 255;
    constant ROM : rom_t := (128, 176, 218, 245, 255, 245, 218, 176,
                             128,  79,  37,  10,   0,  10,  37,  79);
begin
    process(clk)
    begin
        if rising_edge(clk) then
            data <= STD_LOGIC_VECTOR(to_unsigned(ROM(to_integer(unsigned(addr))), 8));
        end if;
    end process;
end Behavioral;
