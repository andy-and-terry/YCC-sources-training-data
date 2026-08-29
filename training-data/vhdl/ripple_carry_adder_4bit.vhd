library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Full_Adder_Cell is
    Port ( a, b, cin : in  STD_LOGIC;
           sum, cout  : out STD_LOGIC);
end Full_Adder_Cell;

architecture Behavioral of Full_Adder_Cell is
begin
    sum  <= a xor b xor cin;
    cout <= (a and b) or (cin and (a xor b));
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Ripple_Carry_Adder_4bit is
    Port ( a, b : in  STD_LOGIC_VECTOR(3 downto 0);
           cin  : in  STD_LOGIC;
           sum  : out STD_LOGIC_VECTOR(3 downto 0);
           cout : out STD_LOGIC);
end Ripple_Carry_Adder_4bit;

architecture Structural of Ripple_Carry_Adder_4bit is
    component Full_Adder_Cell is
        Port ( a, b, cin : in  STD_LOGIC;
               sum, cout  : out STD_LOGIC);
    end component;
    signal carry : STD_LOGIC_VECTOR(3 downto 0);
begin
    fa0: Full_Adder_Cell port map (a(0), b(0), cin, sum(0), carry(0));
    fa1: Full_Adder_Cell port map (a(1), b(1), carry(0), sum(1), carry(1));
    fa2: Full_Adder_Cell port map (a(2), b(2), carry(1), sum(2), carry(2));
    fa3: Full_Adder_Cell port map (a(3), b(3), carry(2), sum(3), cout);
end Structural;
