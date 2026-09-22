-- Classic shift-and-add sequential multiplier: one bit of the multiplier
-- is consumed per clock over 4 cycles, versus the combinational Booth
-- multiplier and the pipelined multiplier elsewhere in this folder, which
-- produce a result in a single cycle (or pipeline stage).
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Sequential_Multiplier_4bit is
    Port ( clk, rst_n, start        : in  STD_LOGIC;
           multiplicand, multiplier : in  STD_LOGIC_VECTOR(3 downto 0);
           product                  : out STD_LOGIC_VECTOR(7 downto 0);
           done                     : out STD_LOGIC);
end Sequential_Multiplier_4bit;

architecture Behavioral of Sequential_Multiplier_4bit is
    signal multiplicand_reg : unsigned(7 downto 0) := (others => '0');
    signal multiplier_reg   : unsigned(3 downto 0) := (others => '0');
    signal product_reg      : unsigned(7 downto 0) := (others => '0');
    signal count            : unsigned(2 downto 0) := (others => '0');
    signal busy             : STD_LOGIC := '0';
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            product_reg      <= (others => '0');
            multiplicand_reg <= (others => '0');
            multiplier_reg   <= (others => '0');
            count            <= (others => '0');
            busy             <= '0';
            done             <= '0';
        elsif rising_edge(clk) then
            done <= '0';
            if start = '1' and busy = '0' then
                product_reg      <= (others => '0');
                multiplicand_reg <= "0000" & unsigned(multiplicand);
                multiplier_reg   <= unsigned(multiplier);
                count            <= "100";
                busy             <= '1';
            elsif busy = '1' then
                if multiplier_reg(0) = '1' then
                    product_reg <= product_reg + multiplicand_reg;
                end if;
                multiplicand_reg <= shift_left(multiplicand_reg, 1);
                multiplier_reg   <= shift_right(multiplier_reg, 1);
                count <= count - 1;
                if count = "001" then
                    busy <= '0';
                    done <= '1';
                end if;
            end if;
        end if;
    end process;
    product <= STD_LOGIC_VECTOR(product_reg);
end Behavioral;
