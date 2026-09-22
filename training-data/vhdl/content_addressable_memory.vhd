-- Content-addressable memory (associative lookup): search_data is compared
-- against every stored entry in parallel each cycle, returning the address
-- of the first match, rather than looking a value up by address like the
-- RAM/register-file/FIFO models elsewhere in this folder.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Content_Addressable_Memory is
    Generic ( WIDTH : integer := 8;
              DEPTH : integer := 16 );
    Port ( clk         : in  STD_LOGIC;
           wr_en       : in  STD_LOGIC;
           wr_addr     : in  integer range 0 to DEPTH-1;
           wr_data     : in  STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           search_data : in  STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           match_addr  : out integer range 0 to DEPTH-1;
           match_found : out STD_LOGIC);
end Content_Addressable_Memory;

architecture Behavioral of Content_Addressable_Memory is
    type mem_array is array (0 to DEPTH-1) of STD_LOGIC_VECTOR(WIDTH-1 downto 0);
    signal entries : mem_array := (others => (others => '0'));
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if wr_en = '1' then
                entries(wr_addr) <= wr_data;
            end if;
        end if;
    end process;

    process(entries, search_data)
        variable found : STD_LOGIC;
        variable addr  : integer range 0 to DEPTH-1;
    begin
        found := '0';
        addr  := 0;
        for i in 0 to DEPTH-1 loop
            if found = '0' and entries(i) = search_data then
                found := '1';
                addr  := i;
            end if;
        end loop;
        match_found <= found;
        match_addr  <= addr;
    end process;
end Behavioral;
