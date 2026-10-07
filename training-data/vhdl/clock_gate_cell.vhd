library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Clock_Gate_Cell is
    Port ( clk       : in  STD_LOGIC;
           enable    : in  STD_LOGIC;
           gated_clk : out STD_LOGIC);
end Clock_Gate_Cell;

architecture Behavioral of Clock_Gate_Cell is
    signal enable_latch : STD_LOGIC := '0';
begin
    process(clk, enable)
    begin
        if clk = '0' then
            enable_latch <= enable;
        end if;
    end process;

    gated_clk <= clk and enable_latch;
end Behavioral;
