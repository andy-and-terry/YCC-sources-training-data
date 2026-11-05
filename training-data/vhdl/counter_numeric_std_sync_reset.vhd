library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Counter8 is
    Port ( clk, rst : in STD_LOGIC; q : out UNSIGNED(7 downto 0) );
end Counter8;

architecture Behavioral of Counter8 is
    signal cnt : UNSIGNED(7 downto 0) := (others => '0');
begin
    process (clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then cnt <= (others => '0');
            else cnt <= cnt + 1;
            end if;
        end if;
    end process;
    q <= cnt;
end Behavioral;
