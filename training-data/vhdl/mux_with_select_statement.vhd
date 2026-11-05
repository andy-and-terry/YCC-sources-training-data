library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux4 is
    Port ( s : in STD_LOGIC_VECTOR(1 downto 0);
           i : in STD_LOGIC_VECTOR(3 downto 0);
           o : out STD_LOGIC );
end Mux4;

architecture Dataflow of Mux4 is
begin
    with s select
        o <= i(0) when "00",
             i(1) when "01",
             i(2) when "10",
             i(3) when others;
end Dataflow;
