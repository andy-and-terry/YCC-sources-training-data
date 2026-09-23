library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity UART_Transmitter is
    Generic ( CLKS_PER_BIT : integer := 87 );
    Port ( clk, rst_n : in  STD_LOGIC;
           tx_start    : in  STD_LOGIC;
           tx_data     : in  STD_LOGIC_VECTOR(7 downto 0);
           tx_serial   : out STD_LOGIC;
           tx_busy     : out STD_LOGIC);
end UART_Transmitter;

architecture Behavioral of UART_Transmitter is
    type state_type is (IDLE, START, DATA, STOP);
    signal state       : state_type := IDLE;
    signal shift_reg   : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal bit_index   : integer range 0 to 7 := 0;
    signal clk_count   : integer range 0 to CLKS_PER_BIT - 1 := 0;
    signal tx_serial_i : STD_LOGIC := '1';
    signal tx_busy_i   : STD_LOGIC := '0';
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            state <= IDLE;
            tx_serial_i <= '1';
            tx_busy_i <= '0';
            clk_count <= 0;
            bit_index <= 0;
        elsif rising_edge(clk) then
            case state is
                when IDLE =>
                    tx_serial_i <= '1';
                    if tx_start = '1' then
                        shift_reg <= tx_data;
                        tx_busy_i <= '1';
                        state <= START;
                    end if;
                when START =>
                    tx_serial_i <= '0';
                    if clk_count < CLKS_PER_BIT - 1 then
                        clk_count <= clk_count + 1;
                    else
                        clk_count <= 0;
                        state <= DATA;
                    end if;
                when DATA =>
                    tx_serial_i <= shift_reg(bit_index);
                    if clk_count < CLKS_PER_BIT - 1 then
                        clk_count <= clk_count + 1;
                    else
                        clk_count <= 0;
                        if bit_index < 7 then
                            bit_index <= bit_index + 1;
                        else
                            bit_index <= 0;
                            state <= STOP;
                        end if;
                    end if;
                when STOP =>
                    tx_serial_i <= '1';
                    if clk_count < CLKS_PER_BIT - 1 then
                        clk_count <= clk_count + 1;
                    else
                        clk_count <= 0;
                        tx_busy_i <= '0';
                        state <= IDLE;
                    end if;
            end case;
        end if;
    end process;

    tx_serial <= tx_serial_i;
    tx_busy <= tx_busy_i;
end Behavioral;
