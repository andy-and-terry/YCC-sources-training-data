library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Saturating_Counter is
    Generic ( WIDTH : integer := 4;
              MAX_VAL : integer := 15 );
    Port ( clk, rst_n, increment, decrement : in  STD_LOGIC;
           count                              : out STD_LOGIC_VECTOR(WIDTH-1 downto 0));
end Saturating_Counter;

architecture Behavioral of Saturating_Counter is
    signal count_internal : unsigned(WIDTH-1 downto 0) := (others => '0');
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            count_internal <= (others => '0');
        elsif rising_edge(clk) then
            if increment = '1' and count_internal < MAX_VAL then
                count_internal <= count_internal + 1;
            elsif decrement = '1' and count_internal > 0 then
                count_internal <= count_internal - 1;
            end if;
        end if;
    end process;
    count <= STD_LOGIC_VECTOR(count_internal);
end Behavioral;
