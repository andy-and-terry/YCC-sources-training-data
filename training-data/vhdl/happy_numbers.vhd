library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- One step of the happy-number iteration for numbers up to 99
entity Happy_Step is
    Port ( n    : in  UNSIGNED(6 downto 0);
           next_n : out UNSIGNED(7 downto 0);
           happy  : out STD_LOGIC);
end Happy_Step;

architecture Behavioral of Happy_Step is
begin
    process(n)
        variable tens, ones : integer;
    begin
        tens := to_integer(n) / 10;
        ones := to_integer(n) mod 10;
        next_n <= to_unsigned(tens * tens + ones * ones, 8);
        if n = 1 then happy <= '1'; else happy <= '0'; end if;
    end process;
end Behavioral;
