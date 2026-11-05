library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_Latch is
    Port ( en : in STD_LOGIC; d : in STD_LOGIC; q : out STD_LOGIC );
end D_Latch;

architecture Behavioral of D_Latch is
begin
    process (en, d)
    begin
        if en = '1' then q <= d; end if;
    end process;
end Behavioral;
