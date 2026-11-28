library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Hamming_Weight is
    Port ( word  : in  STD_LOGIC_VECTOR(7 downto 0);
           count : out INTEGER range 0 to 8);
end Hamming_Weight;

architecture Behavioral of Hamming_Weight is
begin
    process (word)
        variable c : INTEGER range 0 to 8;
    begin
        c := 0;
        for i in word'range loop
            if word(i) = '1' then c := c + 1; end if;
        end loop;
        count <= c;
    end process;
end Behavioral;
