library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Mealy machine: output goes high the same cycle two consecutive 1s are seen.
entity Mealy_Double_One is
    Port ( clk, rst_n, x : in STD_LOGIC;
           z : out STD_LOGIC);
end Mealy_Double_One;

architecture Behavioral of Mealy_Double_One is
    type state_t is (S0, S1);
    signal st : state_t := S0;
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            st <= S0;
        elsif rising_edge(clk) then
            if x = '1' then st <= S1; else st <= S0; end if;
        end if;
    end process;
    z <= '1' when (st = S1 and x = '1') else '0';
end Behavioral;
