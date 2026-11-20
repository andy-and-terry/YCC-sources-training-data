library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Sort four 4-bit values with a compare-exchange network.
entity Sort_4 is
    Port ( a0, a1, a2, a3 : in UNSIGNED(3 downto 0);
           s0, s1, s2, s3 : out UNSIGNED(3 downto 0));
end Sort_4;

architecture Behavioral of Sort_4 is
    procedure cx(signal x, y : in UNSIGNED(3 downto 0); signal lo, hi : out UNSIGNED(3 downto 0)) is
    begin
        if x <= y then lo <= x; hi <= y; else lo <= y; hi <= x; end if;
    end procedure;
    signal b0, b1, b2, b3, c0, c1, c2, c3 : UNSIGNED(3 downto 0);
begin
    process (a0, a1, a2, a3, b0, b1, b2, b3, c1, c2)
    begin
        cx(a0, a1, b0, b1);
        cx(a2, a3, b2, b3);
        cx(b0, b2, c0, c2);
        cx(b1, b3, c1, c3);
        cx(c1, c2, s1, s2);
    end process;
    s0 <= c0;
    s3 <= c3;
end Behavioral;
