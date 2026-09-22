library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decoder_3to8 is
    Port ( sel    : in  STD_LOGIC_VECTOR(2 downto 0);
           enable : in  STD_LOGIC;
           o      : out STD_LOGIC_VECTOR(7 downto 0));
end Decoder_3to8;

architecture Behavioral of Decoder_3to8 is
begin
    process (sel, enable)
    begin
        if enable = '0' then
            o <= "00000000";
        else
            case sel is
                when "000" => o <= "00000001";
                when "001" => o <= "00000010";
                when "010" => o <= "00000100";
                when "011" => o <= "00001000";
                when "100" => o <= "00010000";
                when "101" => o <= "00100000";
                when "110" => o <= "01000000";
                when others => o <= "10000000";
            end case;
        end if;
    end process;
end Behavioral;
