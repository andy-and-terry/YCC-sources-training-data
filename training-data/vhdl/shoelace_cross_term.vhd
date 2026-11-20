library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- One shoelace cross term x1*y2 - x2*y1 with signed inputs.
entity Shoelace_Cross_Term is
    Port ( x1, y1, x2, y2 : in SIGNED(7 downto 0);
           term           : out SIGNED(16 downto 0));
end Shoelace_Cross_Term;

architecture Dataflow of Shoelace_Cross_Term is
begin
    term <= resize(x1 * y2, 17) - resize(x2 * y1, 17);
end Dataflow;
