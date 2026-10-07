library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Absolute_Value is
    Port ( value_in  : in  SIGNED(7 downto 0);
           magnitude : out UNSIGNED(7 downto 0);
           overflow  : out STD_LOGIC);
end Absolute_Value;

architecture Behavioral of Absolute_Value is
begin
    process(value_in)
    begin
        if value_in = to_signed(-128, 8) then
            magnitude <= to_unsigned(128, 8);
            overflow <= '1';
        else
            magnitude <= unsigned(abs(value_in));
            overflow <= '0';
        end if;
    end process;
end Behavioral;
