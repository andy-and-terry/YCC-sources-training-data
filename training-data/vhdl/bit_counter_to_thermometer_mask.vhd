library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Builds a mask with the lowest N bits set, using a for loop in a function.
entity Low_Bit_Mask is
    Port ( n    : in  unsigned(3 downto 0);
           mask : out STD_LOGIC_VECTOR(7 downto 0));
end Low_Bit_Mask;

architecture Behavioral of Low_Bit_Mask is
    function make_mask(k : natural) return STD_LOGIC_VECTOR is
        variable r : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    begin
        for i in 0 to 7 loop
            if i < k then
                r(i) := '1';
            end if;
        end loop;
        return r;
    end function;
begin
    mask <= make_mask(to_integer(n));
end Behavioral;
