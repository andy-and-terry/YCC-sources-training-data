library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Single_Port_RAM is
    Generic ( WIDTH : integer := 8;
              DEPTH : integer := 256 );
    Port ( clk  : in  STD_LOGIC;
           we   : in  STD_LOGIC;
           addr : in  integer range 0 to DEPTH-1;
           din  : in  STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           dout : out STD_LOGIC_VECTOR(WIDTH-1 downto 0));
end Single_Port_RAM;

architecture Behavioral of Single_Port_RAM is
    type mem_array is array (0 to DEPTH-1) of STD_LOGIC_VECTOR(WIDTH-1 downto 0);
    signal mem : mem_array := (others => (others => '0'));
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if we = '1' then
                mem(addr) <= din;
                dout <= din;
            else
                dout <= mem(addr);
            end if;
        end if;
    end process;
end Behavioral;
