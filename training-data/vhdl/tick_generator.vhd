library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Tick_Generator is
    Generic ( CLK_HZ  : integer := 50_000_000;
              TICK_HZ : integer := 1000 );
    Port ( clk, rst_n, enable : in  STD_LOGIC;
           tick               : out STD_LOGIC);
end Tick_Generator;

architecture Behavioral of Tick_Generator is
    constant DIVISOR : integer := CLK_HZ / TICK_HZ;
    signal count : integer range 0 to DIVISOR-1 := 0;
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            count <= 0;
            tick  <= '0';
        elsif rising_edge(clk) then
            tick <= '0';
            if enable = '0' then
                count <= 0;
            elsif count = DIVISOR - 1 then
                count <= 0;
                tick  <= '1';
            else
                count <= count + 1;
            end if;
        end if;
    end process;
end Behavioral;
