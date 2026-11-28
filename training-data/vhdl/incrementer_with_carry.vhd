library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Incrementer_With_Carry is
    Port ( a    : in  UNSIGNED(7 downto 0);
           sum  : out UNSIGNED(7 downto 0);
           cout : out STD_LOGIC);
end Incrementer_With_Carry;

architecture Behavioral of Incrementer_With_Carry is
    signal wide : UNSIGNED(8 downto 0);
begin
    wide <= ('0' & a) + 1;
    sum  <= wide(7 downto 0);
    cout <= wide(8);
end Behavioral;
