library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity shoelace_cross_term is
    port (
        x1, y1, x2, y2 : in  signed(7 downto 0);
        cross          : out signed(16 downto 0)
    );
end shoelace_cross_term;

architecture Behavioral of shoelace_cross_term is
begin
    cross <= resize(x1 * y2, 17) - resize(x2 * y1, 17);
end Behavioral;
