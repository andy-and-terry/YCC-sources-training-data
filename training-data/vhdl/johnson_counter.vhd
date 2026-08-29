library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Johnson_Counter is
    Generic ( WIDTH : integer := 4 );
    Port ( clk, rst_n : in  STD_LOGIC;
           count        : out STD_LOGIC_VECTOR(WIDTH-1 downto 0));
end Johnson_Counter;

architecture Behavioral of Johnson_Counter is
    signal count_internal : STD_LOGIC_VECTOR(WIDTH-1 downto 0) := (others => '0');
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            count_internal <= (others => '0');
        elsif rising_edge(clk) then
            count_internal <= count_internal(WIDTH-2 downto 0) & (not count_internal(WIDTH-1));
        end if;
    end process;
    count <= count_internal;
end Behavioral;
