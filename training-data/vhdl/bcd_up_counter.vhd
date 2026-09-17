library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity BCD_Up_Counter is
    Port ( clk, rst_n, en : in  STD_LOGIC;
           bcd            : out STD_LOGIC_VECTOR(3 downto 0);
           carry_out      : out STD_LOGIC);
end BCD_Up_Counter;

architecture Behavioral of BCD_Up_Counter is
    signal bcd_reg : UNSIGNED(3 downto 0) := (others => '0');
begin
    carry_out <= '1' when (bcd_reg = "1001") and en = '1' else '0';

    process(clk, rst_n)
    begin
        if rst_n = '0' then
            bcd_reg <= (others => '0');
        elsif rising_edge(clk) then
            if en = '1' then
                if bcd_reg = "1001" then
                    bcd_reg <= (others => '0');
                else
                    bcd_reg <= bcd_reg + 1;
                end if;
            end if;
        end if;
    end process;

    bcd <= std_logic_vector(bcd_reg);
end Behavioral;
