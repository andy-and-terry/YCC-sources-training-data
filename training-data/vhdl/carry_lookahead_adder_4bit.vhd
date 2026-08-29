library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Carry_Lookahead_Adder_4bit is
    Port ( a, b : in  STD_LOGIC_VECTOR(3 downto 0);
           cin  : in  STD_LOGIC;
           sum  : out STD_LOGIC_VECTOR(3 downto 0);
           cout : out STD_LOGIC);
end Carry_Lookahead_Adder_4bit;

architecture Behavioral of Carry_Lookahead_Adder_4bit is
    signal p, g : STD_LOGIC_VECTOR(3 downto 0);
    signal c : STD_LOGIC_VECTOR(4 downto 0);
begin
    p <= a xor b;
    g <= a and b;
    c(0) <= cin;
    c(1) <= g(0) or (p(0) and c(0));
    c(2) <= g(1) or (p(1) and g(0)) or (p(1) and p(0) and c(0));
    c(3) <= g(2) or (p(2) and g(1)) or (p(2) and p(1) and g(0)) or (p(2) and p(1) and p(0) and c(0));
    c(4) <= g(3) or (p(3) and g(2)) or (p(3) and p(2) and g(1)) or (p(3) and p(2) and p(1) and g(0)) or (p(3) and p(2) and p(1) and p(0) and c(0));
    sum <= p xor c(3 downto 0);
    cout <= c(4);
end Behavioral;
