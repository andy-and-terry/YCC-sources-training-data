library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Two closed intervals: do they overlap, and what is the union hull?
entity Interval_Overlap_Merge is
    Port ( lo_a, hi_a   : in  UNSIGNED(7 downto 0);
           lo_b, hi_b   : in  UNSIGNED(7 downto 0);
           overlap      : out STD_LOGIC;
           merged_lo    : out UNSIGNED(7 downto 0);
           merged_hi    : out UNSIGNED(7 downto 0));
end Interval_Overlap_Merge;

architecture Dataflow of Interval_Overlap_Merge is
begin
    overlap   <= '1' when lo_a <= hi_b and lo_b <= hi_a else '0';
    merged_lo <= lo_a when lo_a < lo_b else lo_b;
    merged_hi <= hi_a when hi_a > hi_b else hi_b;
end Dataflow;
