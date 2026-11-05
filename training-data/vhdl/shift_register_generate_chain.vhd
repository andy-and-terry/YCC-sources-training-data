library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Shift_Chain is
    Port ( clk, din : in STD_LOGIC; dout : out STD_LOGIC );
end Shift_Chain;

architecture Structural of Shift_Chain is
    signal r : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
begin
    process (clk)
    begin
        if rising_edge(clk) then
            r <= r(2 downto 0) & din;
        end if;
    end process;
    dout <= r(3);
end Structural;
