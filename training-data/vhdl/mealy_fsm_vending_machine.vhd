library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mealy_FSM_Vending_Machine is
    Port ( clk, rst_n, coin_in : in  STD_LOGIC;
           dispense              : out STD_LOGIC);
end Mealy_FSM_Vending_Machine;

architecture Behavioral of Mealy_FSM_Vending_Machine is
    type state_type is (IDLE, HAVE_COIN);
    signal state : state_type := IDLE;
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            state <= IDLE;
            dispense <= '0';
        elsif rising_edge(clk) then
            case state is
                when IDLE =>
                    dispense <= '0';
                    if coin_in = '1' then state <= HAVE_COIN; end if;
                when HAVE_COIN =>
                    if coin_in = '1' then
                        dispense <= '1';
                        state <= IDLE;
                    end if;
            end case;
        end if;
    end process;
end Behavioral;
