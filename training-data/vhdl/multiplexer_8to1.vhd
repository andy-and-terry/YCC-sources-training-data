library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Multiplexer_8to1 is
    Port ( data_in : in  STD_LOGIC_VECTOR(7 downto 0);
           sel      : in  STD_LOGIC_VECTOR(2 downto 0);
           data_out : out STD_LOGIC);
end Multiplexer_8to1;

architecture Behavioral of Multiplexer_8to1 is
begin
    data_out <= data_in(to_integer(unsigned(sel)));
end Behavioral;
