library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Subtractor_4bit is
    Port ( a, b   : in  STD_LOGIC_VECTOR(3 downto 0);
           diff   : out STD_LOGIC_VECTOR(3 downto 0);
           borrow : out STD_LOGIC);
end Subtractor_4bit;

architecture Behavioral of Subtractor_4bit is
    signal result : STD_LOGIC_VECTOR(4 downto 0);
begin
    result <= ('0' & a) - ('0' & b);
    diff <= result(3 downto 0);
    borrow <= result(4);
end Behavioral;
