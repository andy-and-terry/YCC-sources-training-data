library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity absolute_value is
    port ( value     : in  signed(7 downto 0);
           magnitude : out unsigned(7 downto 0);
           overflow  : out std_logic );
end absolute_value;

architecture Behavioral of absolute_value is
begin
    process(value)
    begin
        if value < 0 then
            magnitude <= unsigned(-value);
        else
            magnitude <= unsigned(value);
        end if;
        if value = to_signed(-128, 8) then
            overflow <= '1';
        else
            overflow <= '0';
        end if;
    end process;
end Behavioral;
