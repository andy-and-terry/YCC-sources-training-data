library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Gated SR latch: inputs only matter while enable is high.
entity Gated_SR_Latch is
    Port ( en, s, r : in STD_LOGIC;
           q, qn    : out STD_LOGIC);
end Gated_SR_Latch;

architecture Behavioral of Gated_SR_Latch is
    signal state : STD_LOGIC := '0';
begin
    process(en, s, r)
    begin
        if en = '1' then
            if s = '1' and r = '0' then
                state <= '1';
            elsif s = '0' and r = '1' then
                state <= '0';
            elsif s = '1' and r = '1' then
                state <= 'X';
            end if;
        end if;
    end process;
    q  <= state;
    qn <= not state;
end Behavioral;
