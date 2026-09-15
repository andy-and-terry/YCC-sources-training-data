library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Async_FIFO_DualClock is
    Generic ( ADDR_WIDTH : integer := 4;
              DATA_WIDTH : integer := 8 );
    Port ( wr_clk, wr_rst_n, wr_en : in  STD_LOGIC;
           wr_data                  : in  STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
           full                     : out STD_LOGIC;

           rd_clk, rd_rst_n, rd_en : in  STD_LOGIC;
           rd_data                  : out STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
           empty                    : out STD_LOGIC);
end Async_FIFO_DualClock;

architecture Behavioral of Async_FIFO_DualClock is
    constant DEPTH : integer := 2 ** ADDR_WIDTH;
    type mem_array is array (0 to DEPTH-1) of STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
    signal mem : mem_array;

    signal wr_bin, wr_gray : UNSIGNED(ADDR_WIDTH downto 0) := (others => '0');
    signal rd_bin, rd_gray : UNSIGNED(ADDR_WIDTH downto 0) := (others => '0');

    signal wr_gray_sync1, wr_gray_sync2 : UNSIGNED(ADDR_WIDTH downto 0) := (others => '0');
    signal rd_gray_sync1, rd_gray_sync2 : UNSIGNED(ADDR_WIDTH downto 0) := (others => '0');

    signal full_i, empty_i : STD_LOGIC;
begin
    full_i <= '1' when wr_gray = (not rd_gray_sync2(ADDR_WIDTH downto ADDR_WIDTH-1)) & rd_gray_sync2(ADDR_WIDTH-2 downto 0)
              else '0';
    empty_i <= '1' when rd_gray = wr_gray_sync2 else '0';
    full <= full_i;
    empty <= empty_i;

    -- write-clock domain: memory write and binary/gray pointer update
    process(wr_clk, wr_rst_n)
        variable wr_bin_next : UNSIGNED(ADDR_WIDTH downto 0);
    begin
        if wr_rst_n = '0' then
            wr_bin <= (others => '0');
            wr_gray <= (others => '0');
        elsif rising_edge(wr_clk) then
            if wr_en = '1' and full_i = '0' then
                mem(to_integer(wr_bin(ADDR_WIDTH-1 downto 0))) <= wr_data;
                wr_bin_next := wr_bin + 1;
            else
                wr_bin_next := wr_bin;
            end if;
            wr_bin <= wr_bin_next;
            wr_gray <= (wr_bin_next srl 1) xor wr_bin_next;
        end if;
    end process;

    -- read-clock domain: memory read and binary/gray pointer update
    process(rd_clk, rd_rst_n)
        variable rd_bin_next : UNSIGNED(ADDR_WIDTH downto 0);
    begin
        if rd_rst_n = '0' then
            rd_bin <= (others => '0');
            rd_gray <= (others => '0');
            rd_data <= (others => '0');
        elsif rising_edge(rd_clk) then
            if rd_en = '1' and empty_i = '0' then
                rd_data <= mem(to_integer(rd_bin(ADDR_WIDTH-1 downto 0)));
                rd_bin_next := rd_bin + 1;
            else
                rd_bin_next := rd_bin;
            end if;
            rd_bin <= rd_bin_next;
            rd_gray <= (rd_bin_next srl 1) xor rd_bin_next;
        end if;
    end process;

    -- 2-flop synchronizers crossing each gray pointer into the opposite domain
    process(rd_clk, rd_rst_n)
    begin
        if rd_rst_n = '0' then
            wr_gray_sync1 <= (others => '0');
            wr_gray_sync2 <= (others => '0');
        elsif rising_edge(rd_clk) then
            wr_gray_sync1 <= wr_gray;
            wr_gray_sync2 <= wr_gray_sync1;
        end if;
    end process;

    process(wr_clk, wr_rst_n)
    begin
        if wr_rst_n = '0' then
            rd_gray_sync1 <= (others => '0');
            rd_gray_sync2 <= (others => '0');
        elsif rising_edge(wr_clk) then
            rd_gray_sync1 <= rd_gray;
            rd_gray_sync2 <= rd_gray_sync1;
        end if;
    end process;
end Behavioral;
