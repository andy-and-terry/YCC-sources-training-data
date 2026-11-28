library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Maps a spreadsheet column number 1..26 to its ASCII letter ('A'..'Z').
entity Column_Label_Decoder is
    Port ( column : in  UNSIGNED(4 downto 0);
           letter : out UNSIGNED(7 downto 0);
           valid  : out STD_LOGIC);
end Column_Label_Decoder;

architecture Behavioral of Column_Label_Decoder is
    signal ok : STD_LOGIC;
begin
    ok     <= '1' when column >= 1 and column <= 26 else '0';
    valid  <= ok;
    letter <= to_unsigned(64, 8) + resize(column, 8) when ok = '1' else (others => '0');
end Behavioral;
