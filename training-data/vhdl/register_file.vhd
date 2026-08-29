library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register_File is
    Generic ( WIDTH : integer := 8;
              DEPTH : integer := 16 );
    Port ( clk               : in  STD_LOGIC;
           wr_en             : in  STD_LOGIC;
           wr_addr           : in  integer range 0 to DEPTH-1;
           wr_data           : in  STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           rd_addr1, rd_addr2 : in  integer range 0 to DEPTH-1;
           rd_data1, rd_data2 : out STD_LOGIC_VECTOR(WIDTH-1 downto 0));
end Register_File;

architecture Behavioral of Register_File is
    type reg_array is array (0 to DEPTH-1) of STD_LOGIC_VECTOR(WIDTH-1 downto 0);
    signal registers : reg_array := (others => (others => '0'));
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if wr_en = '1' then
                registers(wr_addr) <= wr_data;
            end if;
        end if;
    end process;
    rd_data1 <= registers(rd_addr1);
    rd_data2 <= registers(rd_addr2);
end Behavioral;
