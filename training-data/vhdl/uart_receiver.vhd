library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity UART_Receiver is
    Generic ( CLKS_PER_BIT : integer := 87 );
    Port ( clk, rst_n : in  STD_LOGIC;
           rx_serial   : in  STD_LOGIC;
           rx_data     : out STD_LOGIC_VECTOR(7 downto 0);
           rx_done     : out STD_LOGIC);
end UART_Receiver;

architecture Behavioral of UART_Receiver is
    type state_type is (IDLE, START, DATA, STOP);
    signal state         : state_type := IDLE;
    signal shift_reg     : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal bit_index     : integer range 0 to 7 := 0;
    signal clk_count     : integer range 0 to CLKS_PER_BIT - 1 := 0;
    signal rx_done_i     : STD_LOGIC := '0';
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            state <= IDLE;
            clk_count <= 0;
            bit_index <= 0;
            rx_done_i <= '0';
        elsif rising_edge(clk) then
            rx_done_i <= '0';
            case state is
                when IDLE =>
                    if rx_serial = '0' then
                        clk_count <= 0;
                        state <= START;
                    end if;
                when START =>
                    if clk_count = (CLKS_PER_BIT - 1) / 2 then
                        if rx_serial = '0' then
                            clk_count <= 0;
                            bit_index <= 0;
                            state <= DATA;
                        else
                            state <= IDLE;
                        end if;
                    else
                        clk_count <= clk_count + 1;
                    end if;
                when DATA =>
                    if clk_count < CLKS_PER_BIT - 1 then
                        clk_count <= clk_count + 1;
                    else
                        clk_count <= 0;
                        shift_reg(bit_index) <= rx_serial;
                        if bit_index < 7 then
                            bit_index <= bit_index + 1;
                        else
                            state <= STOP;
                        end if;
                    end if;
                when STOP =>
                    if clk_count < CLKS_PER_BIT - 1 then
                        clk_count <= clk_count + 1;
                    else
                        clk_count <= 0;
                        rx_done_i <= '1';
                        state <= IDLE;
                    end if;
            end case;
        end if;
    end process;

    rx_data <= shift_reg;
    rx_done <= rx_done_i;
end Behavioral;
