library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Gray_Code_Counter is
    Generic ( WIDTH : integer := 4 );
    Port ( clk, rst_n : in  STD_LOGIC;
           gray_out    : out STD_LOGIC_VECTOR(WIDTH-1 downto 0));
end Gray_Code_Counter;

architecture Behavioral of Gray_Code_Counter is
    signal binary_count : UNSIGNED(WIDTH-1 downto 0) := (others => '0');
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            binary_count <= (others => '0');
        elsif rising_edge(clk) then
            binary_count <= binary_count + 1;
        end if;
    end process;
    gray_out <= std_logic_vector(binary_count xor ('0' & binary_count(WIDTH-1 downto 1)));
end Behavioral;
