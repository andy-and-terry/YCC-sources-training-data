library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Stimulus-only entity that emits a burst pattern using time arithmetic.
entity Pulse_Train_Source is
    Generic ( PULSES : natural := 4;
              HIGH_T : time := 20 ns;
              LOW_T  : time := 30 ns );
    Port ( pulse : out STD_LOGIC );
end Pulse_Train_Source;

architecture Sim of Pulse_Train_Source is
begin
    process
    begin
        pulse <= '0';
        wait for 100 ns;
        for i in 1 to PULSES loop
            pulse <= '1'; wait for HIGH_T;
            pulse <= '0'; wait for LOW_T;
        end loop;
        report "Total burst time: " & time'image(PULSES * (HIGH_T + LOW_T));
        wait;
    end process;
end Sim;
