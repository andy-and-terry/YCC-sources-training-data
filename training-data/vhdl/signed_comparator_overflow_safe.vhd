library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Signed less-than computed through subtraction with overflow correction.
entity Signed_Less_Than is
    Port ( a, b : in signed(7 downto 0);
           lt   : out STD_LOGIC);
end Signed_Less_Than;

architecture Behavioral of Signed_Less_Than is
begin
    process(a, b)
        variable diff : signed(8 downto 0);
        variable ovf  : STD_LOGIC;
    begin
        diff := resize(a, 9) - resize(b, 9);
        ovf  := '0';
        -- 9-bit subtraction cannot overflow, so sign bit is exact
        lt <= diff(8) xor ovf;
    end process;
end Behavioral;
