library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Spread the bits of i onto even positions: reading binary digits in base 4.
entity Moser_De_Bruijn is
    Port ( i     : in  STD_LOGIC_VECTOR(3 downto 0);
           value : out STD_LOGIC_VECTOR(7 downto 0));
end Moser_De_Bruijn;

architecture Dataflow of Moser_De_Bruijn is
begin
    value <= '0' & i(3) & '0' & i(2) & '0' & i(1) & '0' & i(0);  -- 0 1 4 5 16 17 20 21 64 65 for i = 0..9
end Dataflow;
