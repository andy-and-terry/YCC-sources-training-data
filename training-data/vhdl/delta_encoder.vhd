library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Delta_Encoder is
    Port ( clk, rst : in STD_LOGIC;
           x : in UNSIGNED(7 downto 0);
           delta : out UNSIGNED(7 downto 0));
end Delta_Encoder;

architecture Behavioral of Delta_Encoder is
    signal prev : UNSIGNED(7 downto 0) := (others => '0');
begin
    process(clk, rst) begin
        if rst = '1' then
            prev <= (others => '0'); delta <= (others => '0');
        elsif rising_edge(clk) then
            delta <= x - prev; prev <= x;
        end if;
    end process;
end Behavioral;
