library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- When every value occurs twice except one, XOR-ing all bytes leaves the odd one out.
entity XOR_Reduce_Single_Finder is
    Port ( a, b, c, d, e : in  STD_LOGIC_VECTOR(7 downto 0);
           single        : out STD_LOGIC_VECTOR(7 downto 0));
end XOR_Reduce_Single_Finder;

architecture Dataflow of XOR_Reduce_Single_Finder is
begin
    single <= a xor b xor c xor d xor e;
end Dataflow;
