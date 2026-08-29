library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Tri_State_Buffer is
    Port ( data_in, enable : in  STD_LOGIC;
           data_out         : out STD_LOGIC);
end Tri_State_Buffer;

architecture Behavioral of Tri_State_Buffer is
begin
    data_out <= data_in when enable = '1' else 'Z';
end Behavioral;
