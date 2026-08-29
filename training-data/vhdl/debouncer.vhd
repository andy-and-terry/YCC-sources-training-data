library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Debouncer is
    Generic ( COUNTER_WIDTH : integer := 16 );
    Port ( clk, rst_n, noisy_in : in  STD_LOGIC;
           clean_out             : out STD_LOGIC);
end Debouncer;

architecture Behavioral of Debouncer is
    signal counter : unsigned(COUNTER_WIDTH-1 downto 0) := (others => '0');
    signal clean_internal : STD_LOGIC := '0';
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            counter <= (others => '0');
            clean_internal <= '0';
        elsif rising_edge(clk) then
            if noisy_in /= clean_internal then
                counter <= counter + 1;
                if counter = (counter'range => '1') then
                    clean_internal <= noisy_in;
                end if;
            else
                counter <= (others => '0');
            end if;
        end if;
    end process;
    clean_out <= clean_internal;
end Behavioral;
