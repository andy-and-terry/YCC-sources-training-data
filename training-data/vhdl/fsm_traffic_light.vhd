library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FSM_Traffic_Light is
    Port ( clk   : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           state : out STD_LOGIC_VECTOR(1 downto 0));
end FSM_Traffic_Light;

architecture Behavioral of FSM_Traffic_Light is
    type state_type is (RED, GREEN, YELLOW);
    signal current_state : state_type := RED;
begin
    process (clk, reset)
    begin
        if reset = '1' then
            current_state <= RED;
        elsif rising_edge(clk) then
            case current_state is
                when RED    => current_state <= GREEN;
                when GREEN  => current_state <= YELLOW;
                when YELLOW => current_state <= RED;
            end case;
        end if;
    end process;

    state <= "00" when current_state = RED else
              "01" when current_state = GREEN else
              "10";
end Behavioral;
