library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux_2to1_With_Select is
    Port ( a, b : in  STD_LOGIC_VECTOR(7 downto 0);
           sel  : in  STD_LOGIC;
           y    : out STD_LOGIC_VECTOR(7 downto 0));
end Mux_2to1_With_Select;

architecture Dataflow of Mux_2to1_With_Select is
begin
    with sel select
        y <= a when '0',
             b when others;
end Dataflow;
