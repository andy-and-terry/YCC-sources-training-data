library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Generate_Block_Adder_Array is
    Generic ( N : integer := 4 );
    Port ( a, b : in  STD_LOGIC_VECTOR(N-1 downto 0);
           cin  : in  STD_LOGIC;
           sum  : out STD_LOGIC_VECTOR(N-1 downto 0);
           cout : out STD_LOGIC);
end Generate_Block_Adder_Array;

architecture Structural of Generate_Block_Adder_Array is
    signal carry : STD_LOGIC_VECTOR(N downto 0);
begin
    carry(0) <= cin;
    cout <= carry(N);

    adder_gen: for i in 0 to N-1 generate
        sum(i) <= a(i) xor b(i) xor carry(i);
        carry(i+1) <= (a(i) and b(i)) or (carry(i) and (a(i) xor b(i)));
    end generate adder_gen;
end Structural;
