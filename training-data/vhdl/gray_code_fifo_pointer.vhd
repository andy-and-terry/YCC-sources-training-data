library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Binary write pointer with a registered Gray-coded copy for CDC use.
entity Gray_FIFO_Pointer is
    Generic ( AW : positive := 4 );
    Port ( clk, rst_n : in STD_LOGIC;
           inc        : in STD_LOGIC;
           bin_ptr    : out unsigned(AW downto 0);
           gray_ptr   : out STD_LOGIC_VECTOR(AW downto 0));
end Gray_FIFO_Pointer;

architecture Behavioral of Gray_FIFO_Pointer is
    signal bin, bin_next : unsigned(AW downto 0) := (others => '0');
begin
    bin_next <= bin + 1 when inc = '1' else bin;
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            bin <= (others => '0');
            gray_ptr <= (others => '0');
        elsif rising_edge(clk) then
            bin <= bin_next;
            gray_ptr <= std_logic_vector(bin_next xor ('0' & bin_next(AW downto 1)));
        end if;
    end process;
    bin_ptr <= bin;
end Behavioral;
