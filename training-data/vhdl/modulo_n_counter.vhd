library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Modulo_N_Counter is
    Generic ( MOD_VALUE : integer := 6 );
    Port ( clk, rst_n, en : in  STD_LOGIC;
           count           : out STD_LOGIC_VECTOR(7 downto 0);
           tc              : out STD_LOGIC);
end Modulo_N_Counter;

architecture Behavioral of Modulo_N_Counter is
    signal count_internal : unsigned(7 downto 0) := (others => '0');
begin
    tc <= '1' when (count_internal = MOD_VALUE - 1 and en = '1') else '0';

    process(clk, rst_n)
    begin
        if rst_n = '0' then
            count_internal <= (others => '0');
        elsif rising_edge(clk) then
            if en = '1' then
                if count_internal = MOD_VALUE - 1 then
                    count_internal <= (others => '0');
                else
                    count_internal <= count_internal + 1;
                end if;
            end if;
        end if;
    end process;

    count <= STD_LOGIC_VECTOR(count_internal);
end Behavioral;
