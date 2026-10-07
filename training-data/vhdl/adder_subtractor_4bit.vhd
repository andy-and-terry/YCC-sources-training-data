library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Adder_Subtractor_4bit is
    Port ( a, b   : in  STD_LOGIC_VECTOR(3 downto 0);
           sub    : in  STD_LOGIC;
           result : out STD_LOGIC_VECTOR(3 downto 0);
           cout   : out STD_LOGIC);
end Adder_Subtractor_4bit;

architecture Behavioral of Adder_Subtractor_4bit is
    signal b_mux   : STD_LOGIC_VECTOR(3 downto 0);
    signal sum_ext : UNSIGNED(4 downto 0);
begin
    b_mux <= b xor (3 downto 0 => sub);

    sum_ext <= ('0' & UNSIGNED(a)) + ('0' & UNSIGNED(b_mux)) + UNSIGNED("0000" & sub);

    result <= STD_LOGIC_VECTOR(sum_ext(3 downto 0));
    cout   <= sum_ext(4);
end Behavioral;
