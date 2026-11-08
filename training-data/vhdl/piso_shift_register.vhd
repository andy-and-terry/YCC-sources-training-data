library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PISO is
    Port ( clk, load : in STD_LOGIC;
           d : in STD_LOGIC_VECTOR(7 downto 0);
           q : out STD_LOGIC);
end PISO;

architecture Behavioral of PISO is
    signal r : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
begin
    process(clk) begin
        if rising_edge(clk) then
            if load = '1' then r <= d; else r <= r(6 downto 0) & '0'; end if;
        end if;
    end process;
    q <= r(7);
end Behavioral;
