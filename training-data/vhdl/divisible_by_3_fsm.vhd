library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Serial MSB-first input; divisible is high when the bits seen so far are divisible by 3.
entity divisible_by_3_fsm is
    port ( clk, rst_n, bit_in : in  std_logic;
           divisible          : out std_logic );
end divisible_by_3_fsm;

architecture Behavioral of divisible_by_3_fsm is
    signal remainder : integer range 0 to 2 := 0;
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            remainder <= 0;
        elsif rising_edge(clk) then
            case remainder is
                when 0 =>
                    if bit_in = '1' then remainder <= 1; else remainder <= 0; end if;
                when 1 =>
                    if bit_in = '1' then remainder <= 0; else remainder <= 2; end if;
                when 2 =>
                    if bit_in = '1' then remainder <= 2; else remainder <= 1; end if;
            end case;
        end if;
    end process;
    divisible <= '1' when remainder = 0 else '0';
end Behavioral;
