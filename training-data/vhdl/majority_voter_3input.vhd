library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Majority_Voter_3input is
    Port ( a, b, c   : in  STD_LOGIC;
           majority   : out STD_LOGIC;
           disagree   : out STD_LOGIC);
end Majority_Voter_3input;

architecture Behavioral of Majority_Voter_3input is
    signal majority_internal : STD_LOGIC;
begin
    majority_internal <= (a and b) or (b and c) or (a and c);
    majority <= majority_internal;
    disagree <= a xor b xor c xor majority_internal;
end Behavioral;
