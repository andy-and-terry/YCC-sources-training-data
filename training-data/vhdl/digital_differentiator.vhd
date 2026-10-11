library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- First-difference filter y[n] = x[n] - x[n-1].
entity Digital_Differentiator is
    Port ( clk, rst_n : in STD_LOGIC;
           x : in  signed(7 downto 0);
           y : out signed(8 downto 0));
end Digital_Differentiator;

architecture Behavioral of Digital_Differentiator is
    signal x_prev : signed(7 downto 0) := (others => '0');
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            x_prev <= (others => '0');
            y <= (others => '0');
        elsif rising_edge(clk) then
            y <= resize(x, 9) - resize(x_prev, 9);
            x_prev <= x;
        end if;
    end process;
end Behavioral;
