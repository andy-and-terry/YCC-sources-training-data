library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Debounce is
    Port ( clk, noisy : in STD_LOGIC;
           clean : out STD_LOGIC);
end Debounce;

architecture Behavioral of Debounce is
    signal cnt : integer range 0 to 3 := 0;
    signal c : STD_LOGIC := '0';
begin
    process(clk) begin
        if rising_edge(clk) then
            if noisy = c then cnt <= 0;
            elsif cnt = 3 then c <= noisy; cnt <= 0;
            else cnt <= cnt + 1; end if;
        end if;
    end process;
    clean <= c;
end Behavioral;
