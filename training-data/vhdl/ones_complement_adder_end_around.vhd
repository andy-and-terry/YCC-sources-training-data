library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- One's complement addition: carry out is wrapped around (end-around carry).
entity Ones_Complement_Adder is
    Port ( a, b : in  unsigned(7 downto 0);
           s    : out unsigned(7 downto 0));
end Ones_Complement_Adder;

architecture Dataflow of Ones_Complement_Adder is
    signal wide : unsigned(8 downto 0);
begin
    wide <= ('0' & a) + ('0' & b);
    s <= wide(7 downto 0) + ("0000000" & wide(8));
end Dataflow;
