library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- First position (0..3) where the left sum equals the right sum; index_valid is low if none.
entity Equilibrium_Index_4 is
    Port ( x0, x1, x2, x3 : in  UNSIGNED(7 downto 0);
           index          : out UNSIGNED(1 downto 0);
           index_valid    : out STD_LOGIC);
end Equilibrium_Index_4;

architecture Behavioral of Equilibrium_Index_4 is
    signal total, left1, left2, left3 : UNSIGNED(9 downto 0);
    signal e0, e1, e2, e3 : STD_LOGIC;
    signal t0, t1, t2, t3 : UNSIGNED(9 downto 0);
begin
    t0 <= resize(x0, 10);
    t1 <= resize(x1, 10);
    t2 <= resize(x2, 10);
    t3 <= resize(x3, 10);
    total <= t0 + t1 + t2 + t3;
    left1 <= t0;
    left2 <= t0 + t1;
    left3 <= t0 + t1 + t2;

    e0 <= '1' when to_unsigned(0, 10) = total - t0 else '0';
    e1 <= '1' when left1 = total - left1 - t1 else '0';
    e2 <= '1' when left2 = total - left2 - t2 else '0';
    e3 <= '1' when left3 = total - left3 - t3 else '0';

    index <= "00" when e0 = '1' else
             "01" when e1 = '1' else
             "10" when e2 = '1' else
             "11";
    index_valid <= e0 or e1 or e2 or e3;
end Behavioral;
