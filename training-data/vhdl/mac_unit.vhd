library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mac_unit is
    Port ( clk, rst_n : in  STD_LOGIC;
           clear, en  : in  STD_LOGIC;
           a, b       : in  signed(7 downto 0);
           acc        : out signed(23 downto 0));
end mac_unit;

architecture Behavioral of mac_unit is
    signal acc_reg : signed(23 downto 0) := (others => '0');
begin
    acc <= acc_reg;

    -- Multiply-accumulate: acc += a * b
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            acc_reg <= (others => '0');
        elsif rising_edge(clk) then
            if clear = '1' then
                acc_reg <= (others => '0');
            elsif en = '1' then
                acc_reg <= acc_reg + resize(a * b, 24);
            end if;
        end if;
    end process;
end Behavioral;
