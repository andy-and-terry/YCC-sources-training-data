library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sign_extender is
    Generic ( IN_W : integer := 8; OUT_W : integer := 16 );
    Port ( input  : in  STD_LOGIC_VECTOR(IN_W-1 downto 0);
           output : out STD_LOGIC_VECTOR(OUT_W-1 downto 0));
end sign_extender;

architecture Behavioral of sign_extender is
begin
    -- resize on a signed value replicates the sign bit
    output <= std_logic_vector(resize(signed(input), OUT_W));
end Behavioral;
