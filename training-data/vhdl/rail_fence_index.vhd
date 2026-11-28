library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity rail_fence_index is
    generic (RAILS : positive := 3);
    port (
        i    : in  natural range 0 to 255;
        rail : out natural range 0 to RAILS - 1
    );
end rail_fence_index;

architecture Behavioral of rail_fence_index is
    constant PERIOD : positive := 2 * (RAILS - 1);
begin
    process (i)
        variable m : natural;
    begin
        m := i mod PERIOD;
        if m < RAILS then rail <= m; else rail <= PERIOD - m; end if;
    end process;
end Behavioral;
