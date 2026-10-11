library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Guarded block: the guard expression controls guarded assignments.
entity Guarded_Block_Demo is
    Port ( en : in STD_LOGIC;
           d  : in STD_LOGIC;
           q  : out STD_LOGIC);
end Guarded_Block_Demo;

architecture Behavioral of Guarded_Block_Demo is
begin
    latch_blk : block (en = '1')
    begin
        q <= guarded d;
    end block latch_blk;
end Behavioral;
