library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Decade_Counter is
    Port ( clk, rst_n, enable : in  STD_LOGIC;
           count               : out UNSIGNED(3 downto 0);
           carry_out           : out STD_LOGIC);
end Decade_Counter;

architecture Behavioral of Decade_Counter is
    signal count_reg : UNSIGNED(3 downto 0) := (others => '0');
begin
    carry_out <= '1' when (count_reg = 9 and enable = '1') else '0';

    process(clk, rst_n)
    begin
        if rst_n = '0' then
            count_reg <= (others => '0');
        elsif rising_edge(clk) then
            if enable = '1' then
                if count_reg = 9 then
                    count_reg <= (others => '0');
                else
                    count_reg <= count_reg + 1;
                end if;
            end if;
        end if;
    end process;

    count <= count_reg;
end Behavioral;
