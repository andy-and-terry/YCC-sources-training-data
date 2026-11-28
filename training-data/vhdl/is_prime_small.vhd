library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Is_Prime_Small is
    Port ( n     : in  INTEGER range 0 to 63;
           prime : out STD_LOGIC);
end Is_Prime_Small;

architecture Behavioral of Is_Prime_Small is
begin
    process (n)
        variable ok : STD_LOGIC;
    begin
        if n < 2 then ok := '0'; else ok := '1'; end if;
        for d in 2 to 7 loop
            if d < n and (n mod d) = 0 then ok := '0'; end if;
        end loop;
        prime <= ok;
    end process;
end Behavioral;
