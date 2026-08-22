library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Counter is
    Port ( clk   : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           count : out UNSIGNED(7 downto 0));
end Counter;

architecture Behavioral of Counter is
    signal count_reg : UNSIGNED(7 downto 0) := (others => '0');
begin
    process (clk, reset)
    begin
        if reset = '1' then
            count_reg <= (others => '0');
        elsif rising_edge(clk) then
            count_reg <= count_reg + 1;
        end if;
    end process;

    count <= count_reg;
end Behavioral;
