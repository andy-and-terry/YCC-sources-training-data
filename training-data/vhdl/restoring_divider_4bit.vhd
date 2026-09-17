library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Restoring_Divider_4bit is
    Port ( clk, rst_n, start   : in  STD_LOGIC;
           dividend, divisor   : in  STD_LOGIC_VECTOR(3 downto 0);
           quotient, remainder : out STD_LOGIC_VECTOR(3 downto 0);
           done                : out STD_LOGIC);
end Restoring_Divider_4bit;

architecture Behavioral of Restoring_Divider_4bit is
    type state_type is (IDLE, COMPUTE, FINISH);
    signal state       : state_type := IDLE;
    signal bit_count   : UNSIGNED(2 downto 0);
    signal work_reg    : UNSIGNED(7 downto 0);
    signal divisor_reg : UNSIGNED(3 downto 0);
    signal sub_result  : UNSIGNED(4 downto 0);
begin
    sub_result <= ('0' & work_reg(6 downto 3)) - ('0' & divisor_reg);

    process(clk, rst_n)
    begin
        if rst_n = '0' then
            state <= IDLE;
            done <= '0';
            bit_count <= (others => '0');
        elsif rising_edge(clk) then
            case state is
                when IDLE =>
                    done <= '0';
                    if start = '1' then
                        work_reg <= "0000" & unsigned(dividend);
                        divisor_reg <= unsigned(divisor);
                        bit_count <= (others => '0');
                        state <= COMPUTE;
                    end if;
                when COMPUTE =>
                    if sub_result(4) = '0' then
                        work_reg <= sub_result(3 downto 0) & work_reg(2 downto 0) & '1';
                    else
                        work_reg <= work_reg(6 downto 0) & '0';
                    end if;
                    if bit_count = 3 then
                        state <= FINISH;
                    else
                        bit_count <= bit_count + 1;
                    end if;
                when FINISH =>
                    quotient  <= std_logic_vector(work_reg(3 downto 0));
                    remainder <= std_logic_vector(work_reg(7 downto 4));
                    done <= '1';
                    state <= IDLE;
            end case;
        end if;
    end process;
end Behavioral;
