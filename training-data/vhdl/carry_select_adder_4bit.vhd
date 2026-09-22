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

entity Ripple_Adder_2bit is
    Port ( a, b : in  STD_LOGIC_VECTOR(1 downto 0);
           cin  : in  STD_LOGIC;
           sum  : out STD_LOGIC_VECTOR(1 downto 0);
           cout : out STD_LOGIC);
end Ripple_Adder_2bit;

architecture Structural of Ripple_Adder_2bit is
    component Full_Adder_Cell is
        Port ( a, b, cin : in  STD_LOGIC;
               sum, cout  : out STD_LOGIC);
    end component;
    signal c0 : STD_LOGIC;
begin
    fa0: Full_Adder_Cell port map (a(0), b(0), cin, sum(0), c0);
    fa1: Full_Adder_Cell port map (a(1), b(1), c0, sum(1), cout);
end Structural;

-- Splits the 4-bit add into two 2-bit groups. The low group's carry-out
-- selects between two precomputed high-group results (cin='0' and cin='1'),
-- trading duplicated high-group hardware for shorter carry-propagation delay.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Carry_Select_Adder_4bit is
    Port ( a, b : in  STD_LOGIC_VECTOR(3 downto 0);
           cin  : in  STD_LOGIC;
           sum  : out STD_LOGIC_VECTOR(3 downto 0);
           cout : out STD_LOGIC);
end Carry_Select_Adder_4bit;

architecture Structural of Carry_Select_Adder_4bit is
    component Ripple_Adder_2bit is
        Port ( a, b : in  STD_LOGIC_VECTOR(1 downto 0);
               cin  : in  STD_LOGIC;
               sum  : out STD_LOGIC_VECTOR(1 downto 0);
               cout : out STD_LOGIC);
    end component;
    signal c_low                  : STD_LOGIC;
    signal sum_low                : STD_LOGIC_VECTOR(1 downto 0);
    signal sum_high0, sum_high1   : STD_LOGIC_VECTOR(1 downto 0);
    signal cout_high0, cout_high1 : STD_LOGIC;
begin
    low_stage:   Ripple_Adder_2bit port map (a(1 downto 0), b(1 downto 0), cin, sum_low, c_low);
    high_stage0: Ripple_Adder_2bit port map (a(3 downto 2), b(3 downto 2), '0', sum_high0, cout_high0);
    high_stage1: Ripple_Adder_2bit port map (a(3 downto 2), b(3 downto 2), '1', sum_high1, cout_high1);

    sum(1 downto 0) <= sum_low;
    sum(3 downto 2) <= sum_high1 when c_low = '1' else sum_high0;
    cout <= cout_high1 when c_low = '1' else cout_high0;
end Structural;
