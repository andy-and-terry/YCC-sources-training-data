library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Logical shifts, arithmetic shift and rotates on an unsigned/signed byte.
entity Shift_Rotate_Operators_Demo is
    Port ( x          : in  unsigned(7 downto 0);
           s          : in  signed(7 downto 0);
           shl2       : out unsigned(7 downto 0);
           shr2       : out unsigned(7 downto 0);
           rol3       : out unsigned(7 downto 0);
           ror3       : out unsigned(7 downto 0);
           asr2       : out signed(7 downto 0));
end Shift_Rotate_Operators_Demo;

architecture Behavioral of Shift_Rotate_Operators_Demo is
begin
    shl2 <= shift_left(x, 2);
    shr2 <= shift_right(x, 2);
    rol3 <= rotate_left(x, 3);
    ror3 <= rotate_right(x, 3);
    -- shift_right on signed replicates the sign bit
    asr2 <= shift_right(s, 2);
end Behavioral;
