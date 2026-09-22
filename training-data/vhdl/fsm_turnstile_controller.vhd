-- Two-state Moore FSM: a coin unlocks the turnstile, a push through the
-- gate re-locks it. Output depends only on state, unlike the Mealy vending
-- machine elsewhere in this folder whose output also depends on the input.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FSM_Turnstile_Controller is
    Port ( clk, rst_n, coin, push : in  STD_LOGIC;
           unlocked               : out STD_LOGIC);
end FSM_Turnstile_Controller;

architecture Behavioral of FSM_Turnstile_Controller is
    type state_type is (LOCKED, UNLOCKED);
    signal state : state_type := LOCKED;
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            state <= LOCKED;
        elsif rising_edge(clk) then
            case state is
                when LOCKED =>
                    if coin = '1' then state <= UNLOCKED; end if;
                when UNLOCKED =>
                    if push = '1' then state <= LOCKED; end if;
            end case;
        end if;
    end process;
    unlocked <= '1' when state = UNLOCKED else '0';
end Behavioral;
