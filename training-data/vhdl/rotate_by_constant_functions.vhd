library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uses rotate_left / rotate_right from numeric_std for a SHA-like mix step.
entity Rotate_Mix is
    Port ( a, b : in  unsigned(31 downto 0);
           y    : out unsigned(31 downto 0));
end Rotate_Mix;

architecture Dataflow of Rotate_Mix is
begin
    y <= (rotate_left(a, 7) xor rotate_right(a, 18)) + b;
end Dataflow;
