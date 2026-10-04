library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Sign_Extender is
    generic ( IN_WIDTH : positive := 8; OUT_WIDTH : positive := 16 );
    Port ( data_in   : in  STD_LOGIC_VECTOR(IN_WIDTH-1 downto 0);
           is_signed : in  STD_LOGIC;
           data_out  : out STD_LOGIC_VECTOR(OUT_WIDTH-1 downto 0));
end Sign_Extender;

architecture Dataflow of Sign_Extender is
    signal fill : STD_LOGIC;
begin
    fill <= is_signed and data_in(IN_WIDTH-1);
    data_out(IN_WIDTH-1 downto 0) <= data_in;
    data_out(OUT_WIDTH-1 downto IN_WIDTH) <= (others => fill);
end Dataflow;
