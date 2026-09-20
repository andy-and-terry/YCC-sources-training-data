library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Bcd_Adder is
    Port ( a, b : in  STD_LOGIC_VECTOR(3 downto 0);
           cin  : in  STD_LOGIC;
           sum  : out STD_LOGIC_VECTOR(3 downto 0);
           cout : out STD_LOGIC);
end Bcd_Adder;

architecture Behavioral of Bcd_Adder is
    signal binary_sum    : unsigned(4 downto 0);
    signal corrected_sum : unsigned(4 downto 0);
begin
    binary_sum    <= resize(unsigned(a), 5) + resize(unsigned(b), 5) + unsigned(std_logic_vector'("0000") & cin);
    corrected_sum <= binary_sum + 6 when binary_sum > 9 else binary_sum;
    sum  <= std_logic_vector(corrected_sum(3 downto 0));
    cout <= '0' when binary_sum <= 9 else '1';
end Behavioral;
