library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity T_Flip_Flop is
    Port ( clk, rst_n, t : in  STD_LOGIC;
           q              : out STD_LOGIC);
end T_Flip_Flop;

architecture Behavioral of T_Flip_Flop is
    signal q_internal : STD_LOGIC := '0';
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            q_internal <= '0';
        elsif rising_edge(clk) then
            if t = '1' then
                q_internal <= not q_internal;
            end if;
        end if;
    end process;
    q <= q_internal;
end Behavioral;
