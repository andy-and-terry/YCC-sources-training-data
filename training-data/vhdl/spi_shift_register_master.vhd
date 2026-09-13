library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SPI_Shift_Register_Master is
    Generic ( WIDTH : integer := 8 );
    Port ( clk, rst_n, start : in  STD_LOGIC;
           tx_data           : in  STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           sclk, mosi, cs_n  : out STD_LOGIC;
           busy              : out STD_LOGIC);
end SPI_Shift_Register_Master;

architecture Behavioral of SPI_Shift_Register_Master is
    signal shift_reg  : STD_LOGIC_VECTOR(WIDTH-1 downto 0) := (others => '0');
    signal bit_count  : integer range 0 to WIDTH := 0;
    signal sclk_i, mosi_i, cs_n_i, busy_i : STD_LOGIC := '0';
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            sclk_i <= '0';
            mosi_i <= '0';
            cs_n_i <= '1';
            busy_i <= '0';
            bit_count <= 0;
        elsif rising_edge(clk) then
            if start = '1' and busy_i = '0' then
                shift_reg <= tx_data;
                cs_n_i <= '0';
                busy_i <= '1';
                bit_count <= WIDTH;
                sclk_i <= '0';
            elsif busy_i = '1' then
                if sclk_i = '0' then
                    mosi_i <= shift_reg(WIDTH-1);
                    sclk_i <= '1';
                else
                    shift_reg <= shift_reg(WIDTH-2 downto 0) & '0';
                    sclk_i <= '0';
                    if bit_count = 1 then
                        busy_i <= '0';
                        cs_n_i <= '1';
                        bit_count <= 0;
                    else
                        bit_count <= bit_count - 1;
                    end if;
                end if;
            end if;
        end if;
    end process;

    sclk <= sclk_i;
    mosi <= mosi_i;
    cs_n <= cs_n_i;
    busy <= busy_i;
end Behavioral;
