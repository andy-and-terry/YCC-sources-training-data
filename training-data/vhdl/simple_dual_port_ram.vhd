library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Simple_Dual_Port_RAM is
    Generic ( WIDTH : integer := 8;
              DEPTH : integer := 256 );
    Port ( clk               : in  STD_LOGIC;
           wr_en             : in  STD_LOGIC;
           wr_addr           : in  integer range 0 to DEPTH-1;
           wr_data           : in  STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           rd_addr           : in  integer range 0 to DEPTH-1;
           rd_data           : out STD_LOGIC_VECTOR(WIDTH-1 downto 0));
end Simple_Dual_Port_RAM;

architecture Behavioral of Simple_Dual_Port_RAM is
    type mem_array is array (0 to DEPTH-1) of STD_LOGIC_VECTOR(WIDTH-1 downto 0);
    signal mem : mem_array := (others => (others => '0'));
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if wr_en = '1' then
                mem(wr_addr) <= wr_data;
            end if;
            rd_data <= mem(rd_addr);
        end if;
    end process;
end Behavioral;
