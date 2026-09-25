library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Onehot_Multiplexer is
    Port ( d0, d1, d2, d3 : in  STD_LOGIC;
           sel_onehot      : in  STD_LOGIC_VECTOR(3 downto 0);
           y               : out STD_LOGIC);
end Onehot_Multiplexer;

architecture Behavioral of Onehot_Multiplexer is
begin
    y <= (d0 and sel_onehot(0)) or
         (d1 and sel_onehot(1)) or
         (d2 and sel_onehot(2)) or
         (d3 and sel_onehot(3));
end Behavioral;
