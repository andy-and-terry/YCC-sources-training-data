library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Half_Adder is
    Port ( a, b : in STD_LOGIC; s, c : out STD_LOGIC );
end Half_Adder;

architecture Dataflow of Half_Adder is
begin
    s <= a xor b;
    c <= a and b;
end Dataflow;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Full_Adder is
    Port ( a, b, cin : in STD_LOGIC; s, cout : out STD_LOGIC );
end Full_Adder;

architecture Structural of Full_Adder is
    component Half_Adder Port ( a, b : in STD_LOGIC; s, c : out STD_LOGIC ); end component;
    signal s1, c1, c2 : STD_LOGIC;
begin
    h1 : Half_Adder port map (a, b, s1, c1);
    h2 : Half_Adder port map (s1, cin, s, c2);
    cout <= c1 or c2;
end Structural;
