library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Clock_Divider is
    Generic ( DIVISOR : integer := 4 );
    Port ( clk_in, rst_n : in  STD_LOGIC;
           clk_out        : out STD_LOGIC);
end Clock_Divider;

architecture Behavioral of Clock_Divider is
    signal counter : integer range 0 to DIVISOR-1 := 0;
    signal clk_internal : STD_LOGIC := '0';
begin
    process(clk_in, rst_n)
    begin
        if rst_n = '0' then
            counter <= 0;
            clk_internal <= '0';
        elsif rising_edge(clk_in) then
            if counter = DIVISOR - 1 then
                counter <= 0;
                clk_internal <= not clk_internal;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;
    clk_out <= clk_internal;
end Behavioral;
