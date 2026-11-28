library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity BCD_Incrementer_2Digit is
    Port ( bcd_in   : in  UNSIGNED(7 downto 0);
           bcd_out  : out UNSIGNED(7 downto 0);
           overflow : out STD_LOGIC);
end BCD_Incrementer_2Digit;

architecture Behavioral of BCD_Incrementer_2Digit is
begin
    process(bcd_in)
        variable lo : UNSIGNED(3 downto 0);
        variable hi : UNSIGNED(3 downto 0);
    begin
        lo := bcd_in(3 downto 0);
        hi := bcd_in(7 downto 4);
        overflow <= '0';
        if lo < 9 then
            bcd_out <= hi & (lo + 1);
        elsif hi < 9 then
            bcd_out <= (hi + 1) & "0000";
        else
            bcd_out  <= (others => '0');
            overflow <= '1';
        end if;
    end process;
end Behavioral;
