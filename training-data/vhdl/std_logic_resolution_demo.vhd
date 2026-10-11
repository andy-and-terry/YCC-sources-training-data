library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Two drivers on one std_logic net show the resolution function result.
entity Resolution_Demo is
end Resolution_Demo;

architecture Sim of Resolution_Demo is
    signal net : STD_LOGIC;
begin
    net <= '1';
    net <= 'Z', '0' after 10 ns, 'X' after 20 ns;

    monitor : process
    begin
        wait for 5 ns;
        report "t=5: net = " & STD_LOGIC'image(net);
        wait for 10 ns;
        report "t=15: net = " & STD_LOGIC'image(net);
        wait for 10 ns;
        report "t=25: net = " & STD_LOGIC'image(net);
        wait;
    end process;
end Sim;
