library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity fletcher16_checksum is
    port (
        clk, rst, valid : in  std_logic;
        byte_in         : in  unsigned(7 downto 0);
        checksum        : out unsigned(15 downto 0)
    );
end fletcher16_checksum;

architecture Behavioral of fletcher16_checksum is
    signal s1, s2 : unsigned(7 downto 0) := (others => '0');
begin
    process (clk)
        variable a, b : unsigned(8 downto 0);
    begin
        if rising_edge(clk) then
            if rst = '1' then
                s1 <= (others => '0');
                s2 <= (others => '0');
            elsif valid = '1' then
                a := ('0' & s1) + ('0' & byte_in);
                if a >= 255 then a := a - 255; end if;
                b := ('0' & s2) + a;
                if b >= 255 then b := b - 255; end if;
                s1 <= a(7 downto 0);
                s2 <= b(7 downto 0);
            end if;
        end if;
    end process;
    checksum <= s2 & s1;
end Behavioral;
