library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Counter_Terminal_Flags is
    Generic ( MAX_VAL : natural := 9 );
    Port ( clk, rst_n, up, en : in STD_LOGIC;
           q : out natural range 0 to MAX_VAL;
           at_min, at_max : out STD_LOGIC);
end Counter_Terminal_Flags;

architecture Behavioral of Counter_Terminal_Flags is
    signal c : natural range 0 to MAX_VAL := 0;
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            c <= 0;
        elsif rising_edge(clk) then
            if en = '1' then
                if up = '1' and c < MAX_VAL then c <= c + 1;
                elsif up = '0' and c > 0 then c <= c - 1;
                end if;
            end if;
        end if;
    end process;
    q <= c;
    at_min <= '1' when c = 0 else '0';
    at_max <= '1' when c = MAX_VAL else '0';
end Behavioral;
