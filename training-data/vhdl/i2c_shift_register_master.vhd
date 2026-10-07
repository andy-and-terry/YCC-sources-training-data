library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity I2C_Shift_Register_Master is
    Generic ( WIDTH : integer := 8 );
    Port ( clk, rst_n, start : in  STD_LOGIC;
           tx_data           : in  STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           scl, sda          : out STD_LOGIC;
           busy              : out STD_LOGIC);
end I2C_Shift_Register_Master;

architecture Behavioral of I2C_Shift_Register_Master is
    type state_t is (IDLE, START_COND, SHIFT_LOW, SHIFT_HIGH, STOP_COND, STOP_RAISE_SCL, STOP_RAISE_SDA);
    signal state     : state_t := IDLE;
    signal shift_reg : STD_LOGIC_VECTOR(WIDTH-1 downto 0) := (others => '0');
    signal bit_count : integer range 0 to WIDTH := 0;
    signal scl_i, sda_i, busy_i : STD_LOGIC := '1';
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            scl_i     <= '1';
            sda_i     <= '1';
            busy_i    <= '0';
            state     <= IDLE;
            bit_count <= 0;
        elsif rising_edge(clk) then
            case state is
                when IDLE =>
                    if start = '1' and busy_i = '0' then
                        shift_reg <= tx_data;
                        busy_i    <= '1';
                        sda_i     <= '1';
                        scl_i     <= '1';
                        state     <= START_COND;
                    end if;
                when START_COND =>
                    sda_i     <= '0';
                    bit_count <= WIDTH;
                    state     <= SHIFT_LOW;
                when SHIFT_LOW =>
                    scl_i <= '0';
                    sda_i <= shift_reg(WIDTH-1);
                    state <= SHIFT_HIGH;
                when SHIFT_HIGH =>
                    scl_i     <= '1';
                    shift_reg <= shift_reg(WIDTH-2 downto 0) & '0';
                    if bit_count = 1 then
                        state <= STOP_COND;
                    else
                        bit_count <= bit_count - 1;
                        state     <= SHIFT_LOW;
                    end if;
                when STOP_COND =>
                    scl_i <= '0';
                    sda_i <= '0';
                    state <= STOP_RAISE_SCL;
                when STOP_RAISE_SCL =>
                    scl_i <= '1';
                    sda_i <= '0';
                    state <= STOP_RAISE_SDA;
                when STOP_RAISE_SDA =>
                    scl_i  <= '1';
                    sda_i  <= '1';
                    busy_i <= '0';
                    state  <= IDLE;
            end case;
        end if;
    end process;

    scl  <= scl_i;
    sda  <= sda_i;
    busy <= busy_i;
end Behavioral;
