library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Testbench using wait until and wait on to synchronize with a DUT handshake.
entity Wait_Until_Testbench is
end Wait_Until_Testbench;

architecture Sim of Wait_Until_Testbench is
    signal req, ack : STD_LOGIC := '0';
begin
    dut_model : process
    begin
        wait until req = '1';
        wait for 25 ns;
        ack <= '1';
        wait until req = '0';
        ack <= '0';
    end process;

    master : process
    begin
        wait for 10 ns;
        req <= '1';
        wait until ack = '1' for 100 ns;
        assert ack = '1' report "Timeout waiting for ack" severity failure;
        req <= '0';
        wait on ack;
        report "Handshake finished" severity note;
        wait;
    end process;
end Sim;
