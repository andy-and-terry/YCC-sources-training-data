library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Simple_Adder is
    Generic ( N : positive := 8 );
    Port ( a, b : in unsigned(N-1 downto 0);
           s    : out unsigned(N-1 downto 0));
end Simple_Adder;
architecture rtl of Simple_Adder is
begin
    s <= a + b;
end rtl;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Instantiates the same entity at two widths via generic map.
entity Generic_Map_Demo is
    Port ( x, y : in unsigned(15 downto 0);
           sum16 : out unsigned(15 downto 0);
           sum4  : out unsigned(3 downto 0));
end Generic_Map_Demo;

architecture Structural of Generic_Map_Demo is
    component Simple_Adder
        Generic ( N : positive := 8 );
        Port ( a, b : in unsigned(N-1 downto 0);
               s    : out unsigned(N-1 downto 0));
    end component;
begin
    u16 : Simple_Adder generic map (N => 16) port map (a => x, b => y, s => sum16);
    u4  : Simple_Adder generic map (N => 4)
                       port map (a => x(3 downto 0), b => y(3 downto 0), s => sum4);
end Structural;
