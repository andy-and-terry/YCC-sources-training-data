library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MAC_Unit is
    Port ( clk, rst_n, clear, valid : in  STD_LOGIC;
           a, b                     : in  signed(7 downto 0);
           acc                      : out signed(23 downto 0));
end MAC_Unit;

architecture Behavioral of MAC_Unit is
    signal acc_reg : signed(23 downto 0) := (others => '0');
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            acc_reg <= (others => '0');
        elsif rising_edge(clk) then
            if clear = '1' then
                acc_reg <= (others => '0');
            elsif valid = '1' then
                acc_reg <= acc_reg + resize(a * b, 24);
            end if;
        end if;
    end process;
    acc <= acc_reg;
end Behavioral;
