library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Crc8_Serial is
    Port ( clk, rst, bit_in : in STD_LOGIC;
           crc : out STD_LOGIC_VECTOR(7 downto 0));
end Crc8_Serial;

architecture Behavioral of Crc8_Serial is
    signal r : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
begin
    process(clk, rst)
        variable fb : STD_LOGIC;
    begin
        if rst = '1' then
            r <= (others => '0');
        elsif rising_edge(clk) then
            fb := r(7) xor bit_in;
            r <= r(6 downto 0) & '0';
            if fb = '1' then r <= (r(6 downto 0) & '0') xor x"07"; end if;
        end if;
    end process;
    crc <= r;
end Behavioral;
