library IEEE;
use IEEE.NUMERIC_STD.ALL;

entity Lazy_Caterer is
    Port ( cuts   : in  UNSIGNED(3 downto 0);
           pieces : out UNSIGNED(7 downto 0));
end Lazy_Caterer;

architecture Behavioral of Lazy_Caterer is
begin
    process (cuts)
        variable n : UNSIGNED(7 downto 0);
        variable t : UNSIGNED(15 downto 0);
    begin
        n := resize(cuts, 8);
        t := resize(n * n, 16) + resize(n, 16) + 2;
        pieces <= t(8 downto 1);  -- (n*n + n + 2) / 2: 1 2 4 7 11 16 22 29 37 46
    end process;
end Behavioral;
