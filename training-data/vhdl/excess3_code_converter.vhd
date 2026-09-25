library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Excess3_Code_Converter is
    Port ( bcd     : in  STD_LOGIC_VECTOR(3 downto 0);
           excess3 : out STD_LOGIC_VECTOR(3 downto 0));
end Excess3_Code_Converter;

architecture Behavioral of Excess3_Code_Converter is
begin
    excess3 <= bcd + "0011";
end Behavioral;
