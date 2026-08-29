library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Barrel_Shifter is
    Port ( data_in       : in  STD_LOGIC_VECTOR(7 downto 0);
           shift_amount  : in  STD_LOGIC_VECTOR(2 downto 0);
           direction     : in  STD_LOGIC;
           data_out      : out STD_LOGIC_VECTOR(7 downto 0));
end Barrel_Shifter;

architecture Behavioral of Barrel_Shifter is
begin
    data_out <= STD_LOGIC_VECTOR(shift_left(unsigned(data_in), to_integer(unsigned(shift_amount))))
                when direction = '1'
                else STD_LOGIC_VECTOR(shift_right(unsigned(data_in), to_integer(unsigned(shift_amount))));
end Behavioral;
