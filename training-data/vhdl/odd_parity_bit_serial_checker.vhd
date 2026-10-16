library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Tracks running parity of a serial stream; frame restarts on 'start'.
entity Serial_Parity_Tracker is
    Port ( clk, start, din : in STD_LOGIC;
           parity : out STD_LOGIC);
end Serial_Parity_Tracker;

architecture Behavioral of Serial_Parity_Tracker is
    signal p : STD_LOGIC := '0';
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if start = '1' then
                p <= din;
            else
                p <= p xor din;
            end if;
        end if;
    end process;
    parity <= p;
end Behavioral;
