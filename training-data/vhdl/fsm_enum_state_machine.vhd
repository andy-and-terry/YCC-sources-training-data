library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity traffic_light is
    port (clk, rst : in std_logic;
          red, yellow, green : out std_logic);
end traffic_light;

architecture fsm of traffic_light is
    type state_t is (S_RED, S_GREEN, S_YELLOW);
    signal state : state_t := S_RED;
    signal timer : integer range 0 to 7 := 0;
begin
    process (clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                state <= S_RED; timer <= 0;
            elsif timer = 3 then
                timer <= 0;
                case state is
                    when S_RED    => state <= S_GREEN;
                    when S_GREEN  => state <= S_YELLOW;
                    when S_YELLOW => state <= S_RED;
                end case;
            else
                timer <= timer + 1;
            end if;
        end if;
    end process;
    red    <= '1' when state = S_RED else '0';
    green  <= '1' when state = S_GREEN else '0';
    yellow <= '1' when state = S_YELLOW else '0';
end fsm;
