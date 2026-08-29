library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Adder_Tree_4Input is
    Generic ( WIDTH : integer := 8 );
    Port ( a, b, c, d : in  STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           sum          : out STD_LOGIC_VECTOR(WIDTH+1 downto 0));
end Adder_Tree_4Input;

architecture Behavioral of Adder_Tree_4Input is
    signal sum_ab, sum_cd : unsigned(WIDTH downto 0);
begin
    sum_ab <= ('0' & unsigned(a)) + ('0' & unsigned(b));
    sum_cd <= ('0' & unsigned(c)) + ('0' & unsigned(d));
    sum <= STD_LOGIC_VECTOR(('0' & sum_ab) + ('0' & sum_cd));
end Behavioral;
