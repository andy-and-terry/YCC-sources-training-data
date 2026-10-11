library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Valid/ready pipeline stage that holds data under back-pressure.
entity Pipeline_Register_Stage is
    Generic ( WIDTH : integer := 8 );
    Port ( clk, rst_n  : in  STD_LOGIC;
           in_valid    : in  STD_LOGIC;
           in_ready    : out STD_LOGIC;
           in_data     : in  STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           out_valid   : out STD_LOGIC;
           out_ready   : in  STD_LOGIC;
           out_data    : out STD_LOGIC_VECTOR(WIDTH-1 downto 0));
end Pipeline_Register_Stage;

architecture Behavioral of Pipeline_Register_Stage is
    signal v : STD_LOGIC := '0';
    signal d : STD_LOGIC_VECTOR(WIDTH-1 downto 0) := (others => '0');
begin
    in_ready  <= (not v) or out_ready;
    out_valid <= v;
    out_data  <= d;
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            v <= '0';
        elsif rising_edge(clk) then
            if (not v) = '1' or out_ready = '1' then
                v <= in_valid;
                d <= in_data;
            end if;
        end if;
    end process;
end Behavioral;
