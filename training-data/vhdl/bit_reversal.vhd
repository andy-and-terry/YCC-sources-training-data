library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Bit_Reversal is
    Generic ( WIDTH : integer := 8 );
    Port ( d_in  : in  STD_LOGIC_VECTOR(WIDTH - 1 downto 0);
           d_out : out STD_LOGIC_VECTOR(WIDTH - 1 downto 0));
end Bit_Reversal;

architecture Behavioral of Bit_Reversal is
begin
    gen: for i in 0 to WIDTH - 1 generate
        d_out(i) <= d_in(WIDTH - 1 - i);
    end generate;
end Behavioral;
