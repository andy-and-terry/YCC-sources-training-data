library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- A multiplexer written as an indexed array of vectors.
entity Array_Index_Mux is
    Port ( inputs : in  STD_LOGIC_VECTOR(31 downto 0);
           sel    : in  unsigned(2 downto 0);
           y      : out STD_LOGIC_VECTOR(3 downto 0));
end Array_Index_Mux;

architecture Dataflow of Array_Index_Mux is
    type nibble_array is array (0 to 7) of STD_LOGIC_VECTOR(3 downto 0);
    signal nibbles : nibble_array;
begin
    gen : for i in 0 to 7 generate
        nibbles(i) <= inputs(4*i+3 downto 4*i);
    end generate;
    y <= nibbles(to_integer(sel));
end Dataflow;
