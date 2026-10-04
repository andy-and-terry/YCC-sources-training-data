library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Divisible_By_3_FSM is
    Port ( clk, rst_n, bit_in : in  STD_LOGIC;
           divisible          : out STD_LOGIC);
end Divisible_By_3_FSM;

architecture Behavioral of Divisible_By_3_FSM is
    type rem_t is (R0, R1, R2);
    signal rem_s : rem_t := R0;
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            rem_s <= R0;
        elsif rising_edge(clk) then
            case rem_s is
                when R0 =>
                    if bit_in = '1' then rem_s <= R1; else rem_s <= R0; end if;
                when R1 =>
                    if bit_in = '1' then rem_s <= R0; else rem_s <= R2; end if;
                when R2 =>
                    if bit_in = '1' then rem_s <= R2; else rem_s <= R1; end if;
            end case;
        end if;
    end process;
    divisible <= '1' when rem_s = R0 else '0';
end Behavioral;
