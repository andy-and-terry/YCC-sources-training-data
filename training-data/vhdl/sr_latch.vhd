library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SR_Latch is
    Port ( s, r : in  STD_LOGIC;
           q     : out STD_LOGIC;
           qn    : out STD_LOGIC);
end SR_Latch;

architecture Behavioral of SR_Latch is
    signal q_internal : STD_LOGIC := '0';
begin
    process(s, r)
    begin
        if s = '1' and r = '0' then
            q_internal <= '1';
        elsif s = '0' and r = '1' then
            q_internal <= '0';
        end if;
    end process;
    q <= q_internal;
    qn <= not q_internal;
end Behavioral;
