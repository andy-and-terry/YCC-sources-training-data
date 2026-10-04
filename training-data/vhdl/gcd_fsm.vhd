library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity GCD_FSM is
    Generic ( W : integer := 8 );
    Port ( clk, rst_n, start : in  STD_LOGIC;
           a_in, b_in        : in  unsigned(W-1 downto 0);
           result            : out unsigned(W-1 downto 0);
           done              : out STD_LOGIC);
end GCD_FSM;

architecture Behavioral of GCD_FSM is
    type state_t is (IDLE, RUN, FINISH);
    signal state : state_t := IDLE;
    signal a, b  : unsigned(W-1 downto 0) := (others => '0');
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            state  <= IDLE;
            a      <= (others => '0');
            b      <= (others => '0');
            result <= (others => '0');
            done   <= '0';
        elsif rising_edge(clk) then
            case state is
                when IDLE =>
                    done <= '0';
                    if start = '1' then
                        a <= a_in;
                        b <= b_in;
                        state <= RUN;
                    end if;
                when RUN =>
                    if b = 0 then
                        state <= FINISH;
                    elsif a >= b then
                        a <= a - b;
                    else
                        a <= b;
                        b <= a;
                    end if;
                when FINISH =>
                    result <= a;
                    done   <= '1';
                    state  <= IDLE;
            end case;
        end if;
    end process;
end Behavioral;
