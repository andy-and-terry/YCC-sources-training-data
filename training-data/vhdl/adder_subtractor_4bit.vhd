library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Adder_Subtractor_4bit is
    Port ( a, b     : in  STD_LOGIC_VECTOR(3 downto 0);
           sub      : in  STD_LOGIC;
           result   : out STD_LOGIC_VECTOR(3 downto 0);
           cout     : out STD_LOGIC;
           overflow : out STD_LOGIC);
end Adder_Subtractor_4bit;

architecture Behavioral of Adder_Subtractor_4bit is
    signal b_xor    : STD_LOGIC_VECTOR(3 downto 0);
    signal sum_ext  : unsigned(4 downto 0);
    signal result_i : STD_LOGIC_VECTOR(3 downto 0);
begin
    -- XOR-ing b with sub broadcast turns this into a subtractor (two's
    -- complement via invert-and-add-1, same trick as the Verilog original).
    b_xor <= b xor (sub & sub & sub & sub);
    sum_ext <= ('0' & unsigned(a)) + ('0' & unsigned(b_xor)) + sub;
    result_i <= std_logic_vector(sum_ext(3 downto 0));
    result <= result_i;
    cout <= sum_ext(4);
    overflow <= '1' when (a(3) = b_xor(3)) and (result_i(3) /= a(3)) else '0';
end Behavioral;
