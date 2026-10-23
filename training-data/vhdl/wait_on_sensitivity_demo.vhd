library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- A process with no sensitivity list that suspends with "wait on".
-- Equivalent to process(a, b) but the wait can sit anywhere in the body.
entity Wait_On_Sensitivity_Demo is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           y : out STD_LOGIC);
end Wait_On_Sensitivity_Demo;

architecture Behavioral of Wait_On_Sensitivity_Demo is
begin
    process
    begin
        y <= a xor b;
        wait on a, b;
    end process;
end Behavioral;
