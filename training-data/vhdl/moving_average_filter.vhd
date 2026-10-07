library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity moving_average_filter is
    Port ( clk, rst_n : in  STD_LOGIC;
           en         : in  STD_LOGIC;
           sample_in  : in  unsigned(7 downto 0);
           average    : out unsigned(7 downto 0));
end moving_average_filter;

architecture Behavioral of moving_average_filter is
    type window_t is array (0 to 3) of unsigned(7 downto 0);
    signal window : window_t := (others => (others => '0'));
    signal sum    : unsigned(9 downto 0) := (others => '0');
begin
    -- Divide by 4 by taking the upper bits
    average <= sum(9 downto 2);

    process(clk, rst_n)
    begin
        if rst_n = '0' then
            window <= (others => (others => '0'));
            sum <= (others => '0');
        elsif rising_edge(clk) then
            if en = '1' then
                window <= sample_in & window(0 to 2);
                sum <= sum + resize(sample_in, 10) - resize(window(3), 10);
            end if;
        end if;
    end process;
end Behavioral;
