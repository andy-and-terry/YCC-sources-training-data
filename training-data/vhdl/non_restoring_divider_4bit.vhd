library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Non_Restoring_Divider_4bit is
    Port ( clk, rst_n, start : in  STD_LOGIC;
           dividend, divisor : in  STD_LOGIC_VECTOR(3 downto 0);
           quotient          : out STD_LOGIC_VECTOR(3 downto 0);
           remainder         : out STD_LOGIC_VECTOR(3 downto 0);
           done              : out STD_LOGIC);
end Non_Restoring_Divider_4bit;

architecture Behavioral of Non_Restoring_Divider_4bit is
    type state_t is (IDLE, COMPUTE, FINISH);
    signal state       : state_t := IDLE;
    signal count       : integer range 0 to 4 := 0;
    signal acc         : signed(4 downto 0) := (others => '0');
    signal q_reg       : unsigned(3 downto 0) := (others => '0');
    signal divisor_reg : unsigned(3 downto 0) := (others => '0');
begin
    process(clk, rst_n)
        variable shifted   : unsigned(8 downto 0);
        variable a_shifted : signed(4 downto 0);
        variable new_a     : signed(4 downto 0);
    begin
        if rst_n = '0' then
            state <= IDLE;
            done  <= '0';
            count <= 0;
        elsif rising_edge(clk) then
            case state is
                when IDLE =>
                    done <= '0';
                    if start = '1' then
                        acc         <= (others => '0');
                        q_reg       <= unsigned(dividend);
                        divisor_reg <= unsigned(divisor);
                        count       <= 4;
                        state       <= COMPUTE;
                    end if;
                when COMPUTE =>
                    shifted   := shift_left(unsigned(std_logic_vector(acc) & std_logic_vector(q_reg)), 1);
                    a_shifted := signed(shifted(8 downto 4));
                    if a_shifted(4) = '0' then
                        new_a := a_shifted - signed('0' & divisor_reg);
                    else
                        new_a := a_shifted + signed('0' & divisor_reg);
                    end if;
                    acc   <= new_a;
                    q_reg <= shifted(3 downto 1) & (not new_a(4));
                    if count = 1 then
                        state <= FINISH;
                    end if;
                    count <= count - 1;
                when FINISH =>
                    if acc(4) = '1' then
                        remainder <= std_logic_vector(unsigned(std_logic_vector(acc(3 downto 0))) + divisor_reg);
                    else
                        remainder <= std_logic_vector(acc(3 downto 0));
                    end if;
                    quotient <= std_logic_vector(q_reg);
                    done     <= '1';
                    state    <= IDLE;
            end case;
        end if;
    end process;
end Behavioral;
