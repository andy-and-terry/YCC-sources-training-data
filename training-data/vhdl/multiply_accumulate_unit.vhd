library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Multiply_Accumulate_Unit is
    generic ( WIDTH : positive := 8 );
    Port ( clk, rst_n, clear, valid : in  STD_LOGIC;
           a, b        : in  STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           accumulator : out STD_LOGIC_VECTOR(2*WIDTH+3 downto 0));
end Multiply_Accumulate_Unit;

architecture Behavioral of Multiply_Accumulate_Unit is
    signal acc : unsigned(2*WIDTH+3 downto 0) := (others => '0');
    signal product : unsigned(2*WIDTH-1 downto 0);
begin
    product <= unsigned(a) * unsigned(b);

    process(clk, rst_n)
    begin
        if rst_n = '0' then
            acc <= (others => '0');
        elsif rising_edge(clk) then
            if clear = '1' then
                acc <= (others => '0');
            elsif valid = '1' then
                acc <= acc + resize(product, acc'length);
            end if;
        end if;
    end process;
    accumulator <= std_logic_vector(acc);
end Behavioral;
