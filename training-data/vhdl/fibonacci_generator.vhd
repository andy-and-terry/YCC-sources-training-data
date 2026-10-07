library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity fibonacci_generator is
    Port ( clk, rst_n : in  STD_LOGIC;
           next_en    : in  STD_LOGIC;
           fib        : out unsigned(15 downto 0));
end fibonacci_generator;

architecture Behavioral of fibonacci_generator is
    signal prev : unsigned(15 downto 0) := to_unsigned(1, 16);
    signal curr : unsigned(15 downto 0) := to_unsigned(0, 16);
begin
    fib <= curr;

    process(clk, rst_n)
    begin
        if rst_n = '0' then
            prev <= to_unsigned(1, 16);
            curr <= to_unsigned(0, 16);
        elsif rising_edge(clk) then
            if next_en = '1' then
                curr <= curr + prev;
                prev <= curr;
            end if;
        end if;
    end process;
end Behavioral;
