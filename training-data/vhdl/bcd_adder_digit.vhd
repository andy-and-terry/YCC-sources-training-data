library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Adds two BCD digits plus carry-in, producing a BCD digit and carry-out.
entity BCD_Adder_Digit is
    Port ( a, b : in  UNSIGNED(3 downto 0);
           cin  : in  STD_LOGIC;
           sum  : out UNSIGNED(3 downto 0);
           cout : out STD_LOGIC);
end BCD_Adder_Digit;

architecture Behavioral of BCD_Adder_Digit is
    signal raw : UNSIGNED(4 downto 0);
begin
    raw <= resize(a, 5) + resize(b, 5) + ("0000" & cin);
    process(raw)
        variable corrected : UNSIGNED(4 downto 0);
    begin
        if raw > 9 then
            corrected := raw + 6;
            cout <= '1';
        else
            corrected := raw;
            cout <= '0';
        end if;
        sum <= corrected(3 downto 0);
    end process;
end Behavioral;
