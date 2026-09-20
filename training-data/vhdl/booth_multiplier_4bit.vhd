library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Booth_Multiplier_4bit is
    Port ( clk, rst_n, start : in  STD_LOGIC;
           multiplicand      : in  STD_LOGIC_VECTOR(3 downto 0);
           multiplier        : in  STD_LOGIC_VECTOR(3 downto 0);
           product           : out STD_LOGIC_VECTOR(7 downto 0);
           done              : out STD_LOGIC);
end Booth_Multiplier_4bit;

architecture Behavioral of Booth_Multiplier_4bit is
    type state_t is (IDLE, COMPUTE, FINISH);
    signal state    : state_t := IDLE;
    signal count    : integer range 0 to 4 := 0;
    -- a_reg is one bit wider than the operands (5 bits for 4-bit inputs) so
    -- an intermediate add/subtract can never overflow, even for the edge
    -- case multiplicand = -8 (the most negative 4-bit two's complement
    -- value), whose magnitude alone does not fit back into 4 bits.
    signal a_reg    : signed(4 downto 0) := (others => '0');
    signal q_reg    : signed(3 downto 0) := (others => '0');
    signal m_reg    : signed(3 downto 0) := (others => '0');
    signal q_minus1 : STD_LOGIC := '0';
begin
    process(clk, rst_n)
        variable alu_result : signed(4 downto 0);
        variable combined   : signed(9 downto 0);
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
                        a_reg    <= (others => '0');
                        q_reg    <= signed(multiplier);
                        q_minus1 <= '0';
                        m_reg    <= signed(multiplicand);
                        count    <= 4;
                        state    <= COMPUTE;
                    end if;
                when COMPUTE =>
                    if q_reg(0) = '1' and q_minus1 = '0' then
                        alu_result := a_reg - resize(m_reg, 5);
                    elsif q_reg(0) = '0' and q_minus1 = '1' then
                        alu_result := a_reg + resize(m_reg, 5);
                    else
                        alu_result := a_reg;
                    end if;
                    combined := shift_right(alu_result & q_reg & q_minus1, 1);
                    a_reg    <= combined(9 downto 5);
                    q_reg    <= combined(4 downto 1);
                    q_minus1 <= combined(0);
                    if count = 1 then
                        state <= FINISH;
                    end if;
                    count <= count - 1;
                when FINISH =>
                    product <= std_logic_vector(a_reg(3 downto 0)) & std_logic_vector(q_reg);
                    done    <= '1';
                    state   <= IDLE;
            end case;
        end if;
    end process;
end Behavioral;
