library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Array_Multiplier_4bit is
    Port ( a, b    : in  STD_LOGIC_VECTOR(3 downto 0);
           product : out STD_LOGIC_VECTOR(7 downto 0));
end Array_Multiplier_4bit;

architecture Structural of Array_Multiplier_4bit is
    type pp_array is array (0 to 3) of UNSIGNED(7 downto 0);
    signal pp : pp_array;
begin
    pp_gen: for i in 0 to 3 generate
        pp(i) <= shift_left(resize(UNSIGNED(a and (3 downto 0 => b(i))), 8), i);
    end generate pp_gen;

    product <= STD_LOGIC_VECTOR(pp(0) + pp(1) + pp(2) + pp(3));
end Structural;
