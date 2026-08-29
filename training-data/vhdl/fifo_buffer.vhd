library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity FIFO_Buffer is
    Generic ( DEPTH : integer := 4;
              WIDTH : integer := 8 );
    Port ( clk, rst_n, wr_en, rd_en : in  STD_LOGIC;
           data_in                   : in  STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           data_out                  : out STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           full, empty                : out STD_LOGIC);
end FIFO_Buffer;

architecture Behavioral of FIFO_Buffer is
    type mem_array is array (0 to DEPTH-1) of STD_LOGIC_VECTOR(WIDTH-1 downto 0);
    signal mem : mem_array;
    signal wr_ptr, rd_ptr : integer range 0 to DEPTH-1 := 0;
    signal count : integer range 0 to DEPTH := 0;
begin
    full <= '1' when count = DEPTH else '0';
    empty <= '1' when count = 0 else '0';

    process(clk, rst_n)
    begin
        if rst_n = '0' then
            wr_ptr <= 0;
            rd_ptr <= 0;
            count <= 0;
        elsif rising_edge(clk) then
            if wr_en = '1' and count < DEPTH then
                mem(wr_ptr) <= data_in;
                wr_ptr <= (wr_ptr + 1) mod DEPTH;
                count <= count + 1;
            end if;
            if rd_en = '1' and count > 0 then
                data_out <= mem(rd_ptr);
                rd_ptr <= (rd_ptr + 1) mod DEPTH;
                count <= count - 1;
            end if;
        end if;
    end process;
end Behavioral;
