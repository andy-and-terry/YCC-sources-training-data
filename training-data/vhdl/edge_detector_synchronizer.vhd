library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity edge_sync is
    port (clk, rst, async_in : in std_logic;
          rise, fall, level : out std_logic);
end edge_sync;

architecture rtl of edge_sync is
    signal s1, s2, s3 : std_logic := '0';
begin
    process (clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                s1 <= '0'; s2 <= '0'; s3 <= '0';
            else
                s1 <= async_in;
                s2 <= s1;
                s3 <= s2;
            end if;
        end if;
    end process;
    rise  <= s2 and not s3;
    fall  <= not s2 and s3;
    level <= s2;
end rtl;
