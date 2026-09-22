library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Carry_Select_Adder_4bit is
    Port ( a, b : in  STD_LOGIC_VECTOR(3 downto 0);
           cin  : in  STD_LOGIC;
           sum  : out STD_LOGIC_VECTOR(3 downto 0);
           cout : out STD_LOGIC);
end Carry_Select_Adder_4bit;

architecture Behavioral of Carry_Select_Adder_4bit is
    signal sum_lo            : STD_LOGIC_VECTOR(1 downto 0);
    signal cout_lo            : STD_LOGIC;
    signal sum_hi0, sum_hi1   : STD_LOGIC_VECTOR(1 downto 0);
    signal cout_hi0, cout_hi1 : STD_LOGIC;
    signal sum_hi             : STD_LOGIC_VECTOR(1 downto 0);
    signal result_lo          : unsigned(2 downto 0);
    signal result_hi0         : unsigned(2 downto 0);
    signal result_hi1         : unsigned(2 downto 0);
begin
    result_lo  <= ('0' & unsigned(a(1 downto 0))) + unsigned(b(1 downto 0)) + (cin & "");
    cout_lo    <= result_lo(2);
    sum_lo     <= STD_LOGIC_VECTOR(result_lo(1 downto 0));

    result_hi0 <= ('0' & unsigned(a(3 downto 2))) + unsigned(b(3 downto 2));
    result_hi1 <= ('0' & unsigned(a(3 downto 2))) + unsigned(b(3 downto 2)) + 1;
    cout_hi0   <= result_hi0(2);
    sum_hi0    <= STD_LOGIC_VECTOR(result_hi0(1 downto 0));
    cout_hi1   <= result_hi1(2);
    sum_hi1    <= STD_LOGIC_VECTOR(result_hi1(1 downto 0));

    sum_hi <= sum_hi1 when cout_lo = '1' else sum_hi0;
    cout   <= cout_hi1 when cout_lo = '1' else cout_hi0;

    sum <= sum_hi & sum_lo;
end Behavioral;
