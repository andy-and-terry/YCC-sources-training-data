library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Binary_To_BCD_Converter is
    Port ( binary_in    : in  STD_LOGIC_VECTOR(7 downto 0);
           bcd_hundreds : out STD_LOGIC_VECTOR(3 downto 0);
           bcd_tens     : out STD_LOGIC_VECTOR(3 downto 0);
           bcd_ones     : out STD_LOGIC_VECTOR(3 downto 0));
end Binary_To_BCD_Converter;

architecture Behavioral of Binary_To_BCD_Converter is
begin
    -- double-dabble (shift-and-add-3) conversion
    process(binary_in)
        variable shift_reg : UNSIGNED(19 downto 0);
    begin
        shift_reg := (others => '0');
        shift_reg(7 downto 0) := unsigned(binary_in);

        for i in 0 to 7 loop
            if shift_reg(19 downto 16) >= 5 then
                shift_reg(19 downto 16) := shift_reg(19 downto 16) + 3;
            end if;
            if shift_reg(15 downto 12) >= 5 then
                shift_reg(15 downto 12) := shift_reg(15 downto 12) + 3;
            end if;
            if shift_reg(11 downto 8) >= 5 then
                shift_reg(11 downto 8) := shift_reg(11 downto 8) + 3;
            end if;
            shift_reg := shift_reg(18 downto 0) & '0';
        end loop;

        bcd_hundreds <= std_logic_vector(shift_reg(19 downto 16));
        bcd_tens     <= std_logic_vector(shift_reg(15 downto 12));
        bcd_ones     <= std_logic_vector(shift_reg(11 downto 8));
    end process;
end Behavioral;
