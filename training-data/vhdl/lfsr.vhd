library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LFSR is
    Port ( clk, rst_n : in  STD_LOGIC;
           value        : out STD_LOGIC_VECTOR(7 downto 0));
end LFSR;

architecture Behavioral of LFSR is
    signal shift_reg : STD_LOGIC_VECTOR(7 downto 0) := "11111111";
    signal feedback : STD_LOGIC;
begin
    feedback <= shift_reg(7) xor shift_reg(5) xor shift_reg(4) xor shift_reg(3);

    process(clk, rst_n)
    begin
        if rst_n = '0' then
            shift_reg <= "11111111";
        elsif rising_edge(clk) then
            shift_reg <= shift_reg(6 downto 0) & feedback;
        end if;
    end process;
    value <= shift_reg;
end Behavioral;
