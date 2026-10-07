library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FSM_Pedestrian_Crossing is
    Port ( clk        : in  STD_LOGIC;
           rst_n      : in  STD_LOGIC;
           ped_button : in  STD_LOGIC;
           car_green  : out STD_LOGIC;
           car_red    : out STD_LOGIC;
           ped_walk   : out STD_LOGIC);
end FSM_Pedestrian_Crossing;

architecture Behavioral of FSM_Pedestrian_Crossing is
    type state_type is (CARS_GO, CARS_WARN, PED_GO, PED_WARN);
    signal state          : state_type := CARS_GO;
    signal button_latched : STD_LOGIC := '0';
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            state          <= CARS_GO;
            button_latched <= '0';
        elsif rising_edge(clk) then
            case state is
                when CARS_GO =>
                    if button_latched = '1' then
                        state <= CARS_WARN;
                    end if;
                when CARS_WARN =>
                    state <= PED_GO;
                when PED_GO =>
                    state          <= PED_WARN;
                    button_latched <= '0';
                when PED_WARN =>
                    state <= CARS_GO;
            end case;

            if ped_button = '1' then
                button_latched <= '1';
            end if;
        end if;
    end process;

    car_green <= '1' when state = CARS_GO   else '0';
    car_red   <= '1' when state = PED_GO or state = PED_WARN else '0';
    ped_walk  <= '1' when state = PED_GO    else '0';
end Behavioral;
