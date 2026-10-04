library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Absolute_Value is
    generic ( WIDTH : positive := 8 );
    Port ( value_in    : in  STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           magnitude   : out STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           is_negative : out STD_LOGIC;
           overflow    : out STD_LOGIC);
end Absolute_Value;

architecture Behavioral of Absolute_Value is
    signal v : signed(WIDTH-1 downto 0);
    signal neg : STD_LOGIC;
begin
    v <= signed(value_in);
    neg <= value_in(WIDTH-1);
    is_negative <= neg;
    magnitude <= std_logic_vector(unsigned(-v)) when neg = '1' else value_in;
    -- the most negative value has no positive counterpart in two's complement
    overflow <= '1' when neg = '1' and value_in(WIDTH-2 downto 0) = (WIDTH-2 downto 0 => '0') else '0';
end Behavioral;
