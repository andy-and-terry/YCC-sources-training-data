library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity JK_Flip_Flop is
    Port ( clk   : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           j, k  : in  STD_LOGIC;
           q     : out STD_LOGIC);
end JK_Flip_Flop;

architecture Behavioral of JK_Flip_Flop is
    signal q_internal : STD_LOGIC := '0';
begin
    process (clk, reset)
    begin
        if reset = '1' then
            q_internal <= '0';
        elsif rising_edge(clk) then
            if j = '0' and k = '0' then
                q_internal <= q_internal;
            elsif j = '0' and k = '1' then
                q_internal <= '0';
            elsif j = '1' and k = '0' then
                q_internal <= '1';
            else
                q_internal <= not q_internal;
            end if;
        end if;
    end process;

    q <= q_internal;
end Behavioral;
