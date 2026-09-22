library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Skid_Buffer is
    Generic ( WIDTH : integer := 8 );
    Port ( clk, rst_n : in  STD_LOGIC;
           data_in      : in  STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           valid_in     : in  STD_LOGIC;
           ready_out    : out STD_LOGIC;
           data_out     : out STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           valid_out    : out STD_LOGIC;
           ready_in     : in  STD_LOGIC);
end Skid_Buffer;

architecture Behavioral of Skid_Buffer is
    signal skid_reg   : STD_LOGIC_VECTOR(WIDTH-1 downto 0) := (others => '0');
    signal skid_valid : STD_LOGIC := '0';
    signal data_out_internal  : STD_LOGIC_VECTOR(WIDTH-1 downto 0) := (others => '0');
    signal valid_out_internal : STD_LOGIC := '0';
begin
    ready_out <= not skid_valid;

    process(clk, rst_n)
    begin
        if rst_n = '0' then
            skid_reg <= (others => '0');
            skid_valid <= '0';
            data_out_internal <= (others => '0');
            valid_out_internal <= '0';
        elsif rising_edge(clk) then
            if valid_out_internal = '1' and ready_in = '0' then
                if valid_in = '1' and skid_valid = '0' then
                    skid_reg <= data_in;
                    skid_valid <= '1';
                end if;
            else
                if skid_valid = '1' then
                    data_out_internal <= skid_reg;
                    valid_out_internal <= '1';
                    skid_valid <= '0';
                else
                    data_out_internal <= data_in;
                    valid_out_internal <= valid_in;
                end if;
            end if;
        end if;
    end process;

    data_out <= data_out_internal;
    valid_out <= valid_out_internal;
end Behavioral;
