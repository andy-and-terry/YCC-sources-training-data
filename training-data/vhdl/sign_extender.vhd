library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sign_extender is
    generic ( IN_W : positive := 8; OUT_W : positive := 16 );
    port ( input     : in  std_logic_vector(IN_W-1 downto 0);
           is_signed : in  std_logic;
           output    : out std_logic_vector(OUT_W-1 downto 0) );
end sign_extender;

architecture Behavioral of sign_extender is
    signal fill : std_logic;
begin
    fill <= is_signed and input(IN_W-1);
    output(IN_W-1 downto 0) <= input;
    output(OUT_W-1 downto IN_W) <= (others => fill);
end Behavioral;
