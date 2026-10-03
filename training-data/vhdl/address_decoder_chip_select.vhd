library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Address_Decoder_Chip_Select is
    Port ( address    : in  STD_LOGIC_VECTOR(15 downto 0);
           mem_enable : in  STD_LOGIC;
           cs_rom     : out STD_LOGIC;
           cs_ram     : out STD_LOGIC;
           cs_io      : out STD_LOGIC);
end Address_Decoder_Chip_Select;

architecture Behavioral of Address_Decoder_Chip_Select is
begin
    process(address, mem_enable)
    begin
        cs_rom <= '0';
        cs_ram <= '0';
        cs_io  <= '0';
        if mem_enable = '1' then
            case address(15 downto 14) is
                when "00"   => cs_rom <= '1';
                when "01"   => cs_ram <= '1';
                when "10"   => cs_io  <= '1';
                when others => null;
            end case;
        end if;
    end process;
end Behavioral;
