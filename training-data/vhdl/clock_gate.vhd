library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Clock_Gate is
    Port ( clk, enable : in  STD_LOGIC;
           gated_clk     : out STD_LOGIC);
end Clock_Gate;

architecture Behavioral of Clock_Gate is
    signal enable_latched : STD_LOGIC := '0';
begin
    process(clk, enable)
    begin
        if clk = '0' then
            enable_latched <= enable;
        end if;
    end process;

    gated_clk <= clk and enable_latched;
end Behavioral;
