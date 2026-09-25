library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_Latch is
    Port ( d      : in  STD_LOGIC;
           enable : in  STD_LOGIC;
           q      : out STD_LOGIC);
end D_Latch;

architecture Behavioral of D_Latch is
    signal q_internal : STD_LOGIC := '0';
begin
    process(d, enable)
    begin
        if enable = '1' then
            q_internal <= d;
        end if;
    end process;

    q <= q_internal;
end Behavioral;
