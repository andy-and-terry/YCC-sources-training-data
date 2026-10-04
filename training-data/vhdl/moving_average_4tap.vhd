library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Moving_Average_4Tap is
    Port ( clk, rst_n, sample_valid : in  STD_LOGIC;
           sample                   : in  unsigned(7 downto 0);
           average                  : out unsigned(7 downto 0));
end Moving_Average_4Tap;

architecture Behavioral of Moving_Average_4Tap is
    type window_t is array (0 to 2) of unsigned(7 downto 0);
    signal window : window_t := (others => (others => '0'));
begin
    process(clk, rst_n)
        variable sum : unsigned(9 downto 0);
    begin
        if rst_n = '0' then
            window  <= (others => (others => '0'));
            average <= (others => '0');
        elsif rising_edge(clk) then
            if sample_valid = '1' then
                sum := resize(sample, 10) + resize(window(0), 10)
                     + resize(window(1), 10) + resize(window(2), 10);
                average <= sum(9 downto 2);
                window(0) <= sample;
                window(1) <= window(0);
                window(2) <= window(1);
            end if;
        end if;
    end process;
end Behavioral;
