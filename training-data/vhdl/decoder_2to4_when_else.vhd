library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decoder2to4 is
    Port ( a : in STD_LOGIC_VECTOR(1 downto 0); en : in STD_LOGIC; y : out STD_LOGIC_VECTOR(3 downto 0) );
end Decoder2to4;

architecture Dataflow of Decoder2to4 is
begin
    y <= "0000" when en = '0' else
         "0001" when a = "00" else
         "0010" when a = "01" else
         "0100" when a = "10" else
         "1000";
end Dataflow;
