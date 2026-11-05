library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_And is end TB_And;

architecture Sim of TB_And is
    signal a, b, y : STD_LOGIC;
begin
    y <= a and b;
    stim : process
    begin
        a <= '1'; b <= '1'; wait for 10 ns;
        assert y = '1' report "and failed" severity error;
        a <= '0'; wait for 10 ns;
        assert y = '0' report "and failed (0)" severity error;
        report "done";
        wait;
    end process;
end Sim;
