library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Saturating_Adder_8bit is
    Port ( a, b      : in  UNSIGNED(7 downto 0);
           sum       : out UNSIGNED(7 downto 0);
           saturated : out STD_LOGIC);
end Saturating_Adder_8bit;

architecture Behavioral of Saturating_Adder_8bit is
    signal full : UNSIGNED(8 downto 0);
begin
    full <= ('0' & a) + ('0' & b);
    saturated <= full(8);
    sum <= (others => '1') when full(8) = '1' else full(7 downto 0);
end Behavioral;
