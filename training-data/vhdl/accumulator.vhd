library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Accumulator is
    Generic ( IN_WIDTH  : integer := 8;
              ACC_WIDTH : integer := 16 );
    Port ( clk, rst_n, clear, en : in  STD_LOGIC;
           data_in : in  UNSIGNED(IN_WIDTH-1 downto 0);
           acc     : out UNSIGNED(ACC_WIDTH-1 downto 0));
end Accumulator;

architecture Behavioral of Accumulator is
    signal acc_reg : UNSIGNED(ACC_WIDTH-1 downto 0) := (others => '0');
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            acc_reg <= (others => '0');
        elsif rising_edge(clk) then
            if clear = '1' then
                acc_reg <= (others => '0');
            elsif en = '1' then
                acc_reg <= acc_reg + resize(data_in, ACC_WIDTH);
            end if;
        end if;
    end process;
    acc <= acc_reg;
end Behavioral;
