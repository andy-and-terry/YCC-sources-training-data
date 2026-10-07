library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Tristate_Bus_Multiplexer is
    Port ( data_a    : in  STD_LOGIC_VECTOR(7 downto 0);
           data_b    : in  STD_LOGIC_VECTOR(7 downto 0);
           enable_a  : in  STD_LOGIC;
           enable_b  : in  STD_LOGIC;
           bus_out   : out STD_LOGIC_VECTOR(7 downto 0));
end Tristate_Bus_Multiplexer;

architecture Behavioral of Tristate_Bus_Multiplexer is
begin
    bus_out <= data_a when enable_a = '1' else
               data_b when enable_b = '1' else
               (others => 'Z');
end Behavioral;
