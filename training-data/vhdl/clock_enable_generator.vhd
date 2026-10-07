library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clock_enable_generator is
    Generic ( DIV : positive := 10 );
    Port ( clk, rst_n : in  STD_LOGIC;
           tick       : out STD_LOGIC);
end clock_enable_generator;

architecture Behavioral of clock_enable_generator is
    signal cnt : integer range 0 to DIV-1 := 0;
begin
    -- Single-cycle enable pulse every DIV clocks; avoids derived clocks
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            cnt <= 0;
            tick <= '0';
        elsif rising_edge(clk) then
            if cnt = DIV-1 then
                cnt <= 0;
                tick <= '1';
            else
                cnt <= cnt + 1;
                tick <= '0';
            end if;
        end if;
    end process;
end Behavioral;
