library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- acc <= acc - acc/16 + x : exponential leak using an arithmetic shift.
entity Leaky_Integrator is
    Port ( clk, rst_n : in STD_LOGIC;
           x   : in  unsigned(7 downto 0);
           acc : out unsigned(15 downto 0));
end Leaky_Integrator;

architecture Behavioral of Leaky_Integrator is
    signal a : unsigned(15 downto 0) := (others => '0');
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            a <= (others => '0');
        elsif rising_edge(clk) then
            a <= a - shift_right(a, 4) + resize(x, 16);
        end if;
    end process;
    acc <= a;
end Behavioral;
