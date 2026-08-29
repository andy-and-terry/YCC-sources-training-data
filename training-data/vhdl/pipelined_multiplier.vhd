library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Pipelined_Multiplier is
    Generic ( WIDTH : integer := 8 );
    Port ( clk, rst_n : in  STD_LOGIC;
           a, b         : in  STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           product      : out STD_LOGIC_VECTOR(2*WIDTH-1 downto 0));
end Pipelined_Multiplier;

architecture Behavioral of Pipelined_Multiplier is
    signal a_reg, b_reg : STD_LOGIC_VECTOR(WIDTH-1 downto 0) := (others => '0');
    signal product_stage : STD_LOGIC_VECTOR(2*WIDTH-1 downto 0) := (others => '0');
    signal product_internal : STD_LOGIC_VECTOR(2*WIDTH-1 downto 0) := (others => '0');
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            a_reg <= (others => '0');
            b_reg <= (others => '0');
            product_stage <= (others => '0');
            product_internal <= (others => '0');
        elsif rising_edge(clk) then
            a_reg <= a;
            b_reg <= b;
            product_stage <= STD_LOGIC_VECTOR(unsigned(a_reg) * unsigned(b_reg));
            product_internal <= product_stage;
        end if;
    end process;
    product <= product_internal;
end Behavioral;
