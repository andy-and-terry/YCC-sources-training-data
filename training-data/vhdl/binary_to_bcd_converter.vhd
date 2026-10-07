library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Binary_To_Bcd_Converter is
    Port ( binary   : in  STD_LOGIC_VECTOR(7 downto 0);
           hundreds : out STD_LOGIC_VECTOR(3 downto 0);
           tens     : out STD_LOGIC_VECTOR(3 downto 0);
           units    : out STD_LOGIC_VECTOR(3 downto 0));
end Binary_To_Bcd_Converter;

architecture Behavioral of Binary_To_Bcd_Converter is
begin
    process(binary)
        variable shreg : STD_LOGIC_VECTOR(19 downto 0);
    begin
        shreg := (others => '0');
        shreg(7 downto 0) := binary;

        for i in 0 to 7 loop
            if shreg(11 downto 8) > "0100" then
                shreg(11 downto 8) := shreg(11 downto 8) + "0011";
            end if;
            if shreg(15 downto 12) > "0100" then
                shreg(15 downto 12) := shreg(15 downto 12) + "0011";
            end if;
            if shreg(19 downto 16) > "0100" then
                shreg(19 downto 16) := shreg(19 downto 16) + "0011";
            end if;
            shreg := shreg(18 downto 0) & '0';
        end loop;

        hundreds <= shreg(19 downto 16);
        tens     <= shreg(15 downto 12);
        units    <= shreg(11 downto 8);
    end process;
end Behavioral;
