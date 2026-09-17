library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Address_Decoder_Chip_Select is
    Generic ( ADDR_WIDTH : integer := 8 );
    Port ( address     : in  STD_LOGIC_VECTOR(ADDR_WIDTH-1 downto 0);
           enable      : in  STD_LOGIC;
           chip_select : out STD_LOGIC_VECTOR(3 downto 0));
end Address_Decoder_Chip_Select;

architecture Behavioral of Address_Decoder_Chip_Select is
begin
    process(address, enable)
    begin
        if enable = '0' then
            chip_select <= "0000";
        else
            case address(ADDR_WIDTH-1 downto ADDR_WIDTH-2) is
                when "00"   => chip_select <= "0001";
                when "01"   => chip_select <= "0010";
                when "10"   => chip_select <= "0100";
                when others => chip_select <= "1000";
            end case;
        end if;
    end process;
end Behavioral;
