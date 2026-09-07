library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Popcount_8bit is
    Port ( data_in : in  STD_LOGIC_VECTOR(7 downto 0);
           count    : out integer range 0 to 8);
end Popcount_8bit;

architecture Behavioral of Popcount_8bit is
begin
    process(data_in)
        variable total : integer range 0 to 8;
    begin
        total := 0;
        for i in 0 to 7 loop
            if data_in(i) = '1' then
                total := total + 1;
            end if;
        end loop;
        count <= total;
    end process;
end Behavioral;
