-- True dual-port RAM: both ports can independently read AND write any
-- address every cycle, unlike Simple_Dual_Port_RAM (one write-only port,
-- one read-only port). Writing the same address from both ports on the
-- same cycle is a design-level hazard left to the caller to avoid.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity True_Dual_Port_RAM is
    Generic ( WIDTH : integer := 8;
              DEPTH : integer := 256 );
    Port ( clk       : in  STD_LOGIC;
           wr_en_a   : in  STD_LOGIC;
           addr_a    : in  integer range 0 to DEPTH-1;
           wr_data_a : in  STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           rd_data_a : out STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           wr_en_b   : in  STD_LOGIC;
           addr_b    : in  integer range 0 to DEPTH-1;
           wr_data_b : in  STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           rd_data_b : out STD_LOGIC_VECTOR(WIDTH-1 downto 0));
end True_Dual_Port_RAM;

architecture Behavioral of True_Dual_Port_RAM is
    type mem_array is array (0 to DEPTH-1) of STD_LOGIC_VECTOR(WIDTH-1 downto 0);
    signal mem : mem_array := (others => (others => '0'));
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if wr_en_a = '1' then
                mem(addr_a) <= wr_data_a;
            end if;
            rd_data_a <= mem(addr_a);
        end if;
    end process;

    process(clk)
    begin
        if rising_edge(clk) then
            if wr_en_b = '1' then
                mem(addr_b) <= wr_data_b;
            end if;
            rd_data_b <= mem(addr_b);
        end if;
    end process;
end Behavioral;
