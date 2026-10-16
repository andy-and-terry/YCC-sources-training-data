library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Contrasts immediate variable assignment with delta-delayed signal assignment.
entity Variable_Vs_Signal is
    Port ( clk : in STD_LOGIC;
           d   : in STD_LOGIC;
           q_sig_chain : out STD_LOGIC;
           q_var_chain : out STD_LOGIC);
end Variable_Vs_Signal;

architecture Behavioral of Variable_Vs_Signal is
    signal s1, s2 : STD_LOGIC := '0';
begin
    -- Two flip-flops in series
    process(clk)
    begin
        if rising_edge(clk) then
            s1 <= d;
            s2 <= s1;
        end if;
    end process;
    q_sig_chain <= s2;

    -- Variables collapse into a single flip-flop
    process(clk)
        variable v1, v2 : STD_LOGIC := '0';
    begin
        if rising_edge(clk) then
            v1 := d;
            v2 := v1;
            q_var_chain <= v2;
        end if;
    end process;
end Behavioral;
