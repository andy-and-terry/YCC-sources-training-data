library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decoder_2to4 is
    Port ( sel    : in  STD_LOGIC_VECTOR(1 downto 0);
           enable : in  STD_LOGIC;
           o      : out STD_LOGIC_VECTOR(3 downto 0));
end Decoder_2to4;

architecture Behavioral of Decoder_2to4 is
begin
    process (sel, enable)
    begin
        if enable = '0' then
            o <= "0000";
        else
            case sel is
                when "00" => o <= "0001";
                when "01" => o <= "0010";
                when "10" => o <= "0100";
                when others => o <= "1000";
            end case;
        end if;
    end process;
end Behavioral;
