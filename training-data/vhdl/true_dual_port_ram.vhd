library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity True_Dual_Port_RAM is
    Generic ( WIDTH : integer := 8;
              DEPTH : integer := 256 );
    Port ( clk     : in  STD_LOGIC;
           we_a    : in  STD_LOGIC;
           addr_a  : in  integer range 0 to DEPTH-1;
           din_a   : in  STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           dout_a  : out STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           we_b    : in  STD_LOGIC;
           addr_b  : in  integer range 0 to DEPTH-1;
           din_b   : in  STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           dout_b  : out STD_LOGIC_VECTOR(WIDTH-1 downto 0));
end True_Dual_Port_RAM;

architecture Behavioral of True_Dual_Port_RAM is
    type mem_array is array (0 to DEPTH-1) of STD_LOGIC_VECTOR(WIDTH-1 downto 0);
    signal mem : mem_array := (others => (others => '0'));
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if we_a = '1' then
                mem(addr_a) <= din_a;
                dout_a <= din_a;
            else
                dout_a <= mem(addr_a);
            end if;
        end if;
    end process;

    process(clk)
    begin
        if rising_edge(clk) then
            if we_b = '1' then
                mem(addr_b) <= din_b;
                dout_b <= din_b;
            else
                dout_b <= mem(addr_b);
            end if;
        end if;
    end process;
end Behavioral;
