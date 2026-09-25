library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplexer_4to1_Tree is
    Port ( d0, d1, d2, d3 : in  STD_LOGIC;
           sel             : in  STD_LOGIC_VECTOR(1 downto 0);
           y               : out STD_LOGIC);
end Multiplexer_4to1_Tree;

architecture Behavioral of Multiplexer_4to1_Tree is
    signal low_stage, high_stage : STD_LOGIC;
begin
    low_stage  <= d0 when sel(0) = '0' else d1;
    high_stage <= d2 when sel(0) = '0' else d3;
    y          <= low_stage when sel(1) = '0' else high_stage;
end Behavioral;
