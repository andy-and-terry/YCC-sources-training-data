-- Population count (number of set bits) for 0..15
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity PopcountTable is
    port ( value : in  unsigned(3 downto 0);
           count : out unsigned(2 downto 0) );
end entity;

architecture rtl of PopcountTable is
begin
    process (value)
        variable c : unsigned(2 downto 0);
    begin
        c := (others => '0');
        for i in value'range loop
            if value(i) = '1' then
                c := c + 1;
            end if;
        end loop;
        count <= c;
    end process;
end architecture;
