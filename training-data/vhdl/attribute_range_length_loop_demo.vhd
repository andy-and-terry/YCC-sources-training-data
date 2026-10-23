library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Loops written with 'range and 'length so the width is never hard-coded.
entity Attribute_Range_Length_Loop_Demo is
    Generic ( WIDTH : positive := 8 );
    Port ( d        : in  STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           reversed : out STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           ones     : out integer range 0 to WIDTH);
end Attribute_Range_Length_Loop_Demo;

architecture Behavioral of Attribute_Range_Length_Loop_Demo is
begin
    process(d)
        variable count : integer range 0 to WIDTH;
    begin
        count := 0;
        for i in d'range loop
            reversed(d'length - 1 - i) <= d(i);
            if d(i) = '1' then
                count := count + 1;
            end if;
        end loop;
        ones <= count;
    end process;
end Behavioral;
