library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity BCD_Adder is
    Port ( a, b : in  UNSIGNED(3 downto 0);
           cin   : in  STD_LOGIC;
           sum   : out UNSIGNED(3 downto 0);
           cout  : out STD_LOGIC);
end BCD_Adder;

architecture Behavioral of BCD_Adder is
begin
    process(a, b, cin)
        variable bsum : UNSIGNED(4 downto 0);
    begin
        bsum := ('0' & a) + ('0' & b);
        if cin = '1' then
            bsum := bsum + 1;
        end if;

        if bsum > 9 then
            sum  <= bsum(3 downto 0) + 6;
            cout <= '1';
        else
            sum  <= bsum(3 downto 0);
            cout <= '0';
        end if;
    end process;
end Behavioral;
