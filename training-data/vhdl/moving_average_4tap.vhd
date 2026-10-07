library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Moving_Average_4tap is
    Port ( clk, rst_n, valid : in  STD_LOGIC;
           sample_in : in  UNSIGNED(7 downto 0);
           average   : out UNSIGNED(7 downto 0));
end Moving_Average_4tap;

architecture Behavioral of Moving_Average_4tap is
    type tap_array is array (0 to 3) of UNSIGNED(7 downto 0);
    signal taps : tap_array := (others => (others => '0'));
    signal sum  : UNSIGNED(9 downto 0);
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            taps <= (others => (others => '0'));
        elsif rising_edge(clk) then
            if valid = '1' then
                taps <= sample_in & taps(0 to 2);
            end if;
        end if;
    end process;

    sum <= resize(taps(0), 10) + resize(taps(1), 10) + resize(taps(2), 10) + resize(taps(3), 10);
    average <= sum(9 downto 2);  -- divide by 4
end Behavioral;
