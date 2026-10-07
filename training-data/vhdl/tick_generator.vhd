library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Tick_Generator is
    generic ( CLK_FREQ_HZ  : positive := 50_000_000;
              TICK_FREQ_HZ : positive := 1_000 );
    Port ( clk, rst_n, enable : in  STD_LOGIC;
           tick : out STD_LOGIC);
end Tick_Generator;

architecture Behavioral of Tick_Generator is
    constant DIVISOR : positive := CLK_FREQ_HZ / TICK_FREQ_HZ;
    signal counter : integer range 0 to DIVISOR - 1 := 0;
    signal tick_r  : STD_LOGIC := '0';
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            counter <= 0;
            tick_r <= '0';
        elsif rising_edge(clk) then
            if enable = '0' then
                counter <= 0;
                tick_r <= '0';
            elsif counter = DIVISOR - 1 then
                counter <= 0;
                tick_r <= '1';
            else
                counter <= counter + 1;
                tick_r <= '0';
            end if;
        end if;
    end process;
    tick <= tick_r;
end Behavioral;
