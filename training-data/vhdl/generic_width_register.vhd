library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg_N is
    Generic ( N : positive := 8 );
    Port ( clk, load : in STD_LOGIC;
           d : in STD_LOGIC_VECTOR(N-1 downto 0);
           q : out STD_LOGIC_VECTOR(N-1 downto 0) );
end Reg_N;

architecture Behavioral of Reg_N is
begin
    process (clk)
    begin
        if rising_edge(clk) and load = '1' then q <= d; end if;
    end process;
end Behavioral;
