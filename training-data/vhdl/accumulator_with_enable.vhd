library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Accumulator_With_Enable is
    generic ( IN_WIDTH : positive := 8; ACC_WIDTH : positive := 16 );
    Port ( clk, rst_n, clear, enable : in  STD_LOGIC;
           data_in  : in  STD_LOGIC_VECTOR(IN_WIDTH-1 downto 0);
           sum      : out STD_LOGIC_VECTOR(ACC_WIDTH-1 downto 0);
           overflow : out STD_LOGIC);
end Accumulator_With_Enable;

architecture Behavioral of Accumulator_With_Enable is
    signal acc  : unsigned(ACC_WIDTH-1 downto 0) := (others => '0');
    signal ovf  : STD_LOGIC := '0';
    signal next_sum : unsigned(ACC_WIDTH downto 0);
begin
    next_sum <= resize(acc, ACC_WIDTH + 1) + resize(unsigned(data_in), ACC_WIDTH + 1);

    process(clk, rst_n)
    begin
        if rst_n = '0' then
            acc <= (others => '0');
            ovf <= '0';
        elsif rising_edge(clk) then
            if clear = '1' then
                acc <= (others => '0');
                ovf <= '0';
            elsif enable = '1' then
                acc <= next_sum(ACC_WIDTH-1 downto 0);
                if next_sum(ACC_WIDTH) = '1' then
                    ovf <= '1';
                end if;
            end if;
        end if;
    end process;
    sum <= std_logic_vector(acc);
    overflow <= ovf;
end Behavioral;
