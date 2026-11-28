library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Deficient_Check is
    Port ( n         : in  INTEGER range 1 to 31;
           deficient : out STD_LOGIC);
end Deficient_Check;

architecture Behavioral of Deficient_Check is
begin
    process (n)
        variable sigma : INTEGER range 0 to 255;
    begin
        sigma := 0;
        for d in 1 to 31 loop
            if d <= n and (n mod d) = 0 then sigma := sigma + d; end if;
        end loop;
        if sigma < 2 * n then deficient <= '1'; else deficient <= '0'; end if;
    end process;
end Behavioral;
