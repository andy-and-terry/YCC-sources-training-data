library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Single_Port_RAM is
    Generic ( ADDR_WIDTH : integer := 4;
              DATA_WIDTH : integer := 8 );
    Port ( clk      : in  STD_LOGIC;
           we       : in  STD_LOGIC;
           address  : in  STD_LOGIC_VECTOR(ADDR_WIDTH-1 downto 0);
           data_in  : in  STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
           data_out : out STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0));
end Single_Port_RAM;

architecture Behavioral of Single_Port_RAM is
    type ram_type is array (0 to (2**ADDR_WIDTH)-1) of STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
    signal ram : ram_type := (others => (others => '0'));
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if we = '1' then
                ram(to_integer(unsigned(address))) <= data_in;
            end if;
            data_out <= ram(to_integer(unsigned(address)));
        end if;
    end process;
end Behavioral;
