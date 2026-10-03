library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mealy_FSM_Serial_Adder is
    Port ( clk     : in  STD_LOGIC;
           rst_n   : in  STD_LOGIC;
           a_bit   : in  STD_LOGIC;
           b_bit   : in  STD_LOGIC;
           sum_bit : out STD_LOGIC);
end Mealy_FSM_Serial_Adder;

architecture Behavioral of Mealy_FSM_Serial_Adder is
    type state_type is (NO_CARRY, CARRY);
    signal state : state_type := NO_CARRY;
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            state <= NO_CARRY;
        elsif rising_edge(clk) then
            case state is
                when NO_CARRY =>
                    if (a_bit and b_bit) = '1' then
                        state <= CARRY;
                    else
                        state <= NO_CARRY;
                    end if;
                when CARRY =>
                    if (a_bit or b_bit) = '1' then
                        state <= CARRY;
                    else
                        state <= NO_CARRY;
                    end if;
            end case;
        end if;
    end process;

    process(state, a_bit, b_bit)
    begin
        case state is
            when NO_CARRY => sum_bit <= a_bit xor b_bit;
            when CARRY    => sum_bit <= a_bit xor b_bit xor '1';
        end case;
    end process;
end Behavioral;
