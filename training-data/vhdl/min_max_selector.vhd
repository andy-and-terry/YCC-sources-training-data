library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity min_max_selector is
    port ( a, b     : in  unsigned(7 downto 0);
           min_val  : out unsigned(7 downto 0);
           max_val  : out unsigned(7 downto 0) );
end min_max_selector;

architecture Behavioral of min_max_selector is
begin
    process(a, b)
    begin
        if a < b then
            min_val <= a;
            max_val <= b;
        else
            min_val <= b;
            max_val <= a;
        end if;
    end process;
end Behavioral;
