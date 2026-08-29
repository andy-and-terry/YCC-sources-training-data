library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Moore_FSM_Sequence_Detector is
    Port ( clk, rst_n, data_in : in  STD_LOGIC;
           detected             : out STD_LOGIC);
end Moore_FSM_Sequence_Detector;

architecture Behavioral of Moore_FSM_Sequence_Detector is
    type state_type is (S0, S1, S2, S3);
    signal state, next_state : state_type := S0;
begin
    detected <= '1' when state = S3 else '0';

    process(clk, rst_n)
    begin
        if rst_n = '0' then
            state <= S0;
        elsif rising_edge(clk) then
            state <= next_state;
        end if;
    end process;

    process(state, data_in)
    begin
        case state is
            when S0 => next_state <= S1 when data_in = '1' else S0;
            when S1 => next_state <= S1 when data_in = '1' else S2;
            when S2 => next_state <= S3 when data_in = '1' else S0;
            when S3 => next_state <= S1 when data_in = '1' else S2;
        end case;
    end process;
end Behavioral;
